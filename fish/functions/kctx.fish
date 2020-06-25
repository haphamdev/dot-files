function kctx
    kubectl config use-context $argv[1] 
end

complete -f -c kctx -a "eks-dev minikube"
