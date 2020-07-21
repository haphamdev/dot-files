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
        kubectl logs -f $pod -c $container
    else # Only one container in pod
        set_color yellow --bold; printf "\uf0f6 Log of $pod\n"; set_color normal
        kubectl logs -f $pod
    end
end
