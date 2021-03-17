function klg
    set -l arg_count (count $argv)

    if test $arg_count -eq 0
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
        fzf --height=15 --border --header="== Select pod:" --reverse | read pod;

        if test -z $pod 
            echo \ufc38 Aborted
            return 1
        end

        echo \uf046 Pod: $pod
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
            kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}' |\
            tr " " "\n" | fzf --height=15 --border --header="== Select container:" --reverse | read container

            if test -z $container
                echo \ufc38 Aborted
                return 1
            end

            echo \uf046 Container: $container
        end

        set log_file_path ~/lnav-logs/$pod--$container.log
        echo \uf0f6 Opening the log file $log_file_path
        kubectl logs -f $pod -c $container > $log_file_path &
    else # Only one container in pod
        set log_file_path ~/lnav-logs/$pod.log
        echo \uf0f6 Opening the log file $log_file_path
        kubectl logs -f $pod > $log_file_path &
    end

    set -l job_id (jobs -lp)
    lnav $log_file_path
    kill $job_id
    echo \uf014 Removing log file $log_file_path
    rm $log_file_path
end
