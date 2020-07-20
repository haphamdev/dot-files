function kct
    kubectl config use-context $argv[1] 
end

complete -f -c kct -a "eks-dev minikube"
