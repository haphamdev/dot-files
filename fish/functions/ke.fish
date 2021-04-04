function ke -d "Execute a command for a container in a K8s pod"
    echo Please select K8s pod:
    kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
    fzf --height=15| read -l pod;
    echo ✅ $pod is selected

    set -l container_names_str (kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}')
    set -l containers (string split ' ' $container_names_str) # convert string to array

    if test (count $containers) -gt 1
        echo Please select container inside pod $pod:
        kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}' |\
        tr " " "\n" | fzf --height=15 | read container
        echo ✅ $container is selected
    end

    read -P "Enter command to execute: " -l command_string
    set -l command (echo $command_string | tr ' ' "\n")

    if set -q container
        kubectl exec -it pods/$pod --container $container -- $command
    else
        kubectl exec -it pods/$pod -- $command
    end
end
