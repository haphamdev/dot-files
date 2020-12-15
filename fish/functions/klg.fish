function klg
    set -l arg_count (count $argv)

    if test $arg_count -eq 0
        echo Please select a pod:
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
        fzf --height=15 --border | read pod;
        echo ✅ $pod is selected
    else
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
        fzf --filter $argv[1] | read pod;
    end

    set -l containers (string split ' ' \
        (kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}')) # convert string to array

    set dir_lnav_logs = "~/lnav-logs/"

    if test (count $containers) -gt 1 # Multiple containers in pod
        if test $arg_count -gt 1
            kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}' |\
            tr " " "\n" | fzf --filter $argv[2] | read container
        else
            echo Please select container inside pod $pod:
            kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}' |\
            tr " " "\n" | fzf --height=15 --border | read container
            echo ✅ $container is selected
        end

        set_color yellow --bold; printf "\uf0f6 Log of $pod/$container\n"; set_color normal
        set log_file_path ~/lnav-logs/$pod--$container.log
        echo log file path is $log_file_path
        kubectl logs -f $pod -c $container > $log_file_path &
    else # Only one container in pod
        set_color yellow --bold; printf "\uf0f6 Log of $pod\n"; set_color normal
        set log_file_path ~/lnav-logs/$pod.log
        echo Log file path is $log_file_path
        kubectl logs -f $pod > $log_file_path &
    end

    set -l job_id (jobs -lp)
    lnav $log_file_path
    kill $job_id
    rm $log_file_path
end
