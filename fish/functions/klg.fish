function klg
    echo Please select a pod:
    kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
    fzf --height=15 | read -l pod;
    echo ✅ $pod is selected

    set -l containers (string split ' ' \
        (kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}')) # convert string to array

    if test (count $containers) -gt 1 # Multiple containers in pod
        echo Please select container inside pod $pod:
        kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}' |\
        tr " " "\n" | fzf --height=15 | read -l container
        echo ✅ $container is selected

        kubectl logs -f $pod -c $container
    else # Only one container in pod
        kubectl logs -f $pod
    end
end
