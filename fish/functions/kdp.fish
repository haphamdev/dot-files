function kdp -d "Describe a pod"
    set -l arg_count (count $argv)

    if test $arg_count -eq 0
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
        fzf --height=15 --border --header="== Select pod:" --reverse | read pod;

        if test -z $pod 
            echo \ufc38 Aborted or not found
            return 1
        end
    else
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
        fzf --filter $argv[1] | read pod;
    end

    echo \uf046 Pod: $pod

    kubectl describe pods/$pod | less +G   
end
