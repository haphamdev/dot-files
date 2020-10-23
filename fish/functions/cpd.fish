function cpd -d "Copy k8s pod name to clipboard"
    echo Please select a pod:
    kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
    fzf --height=15 --border | read pod;
    echo $pod | pbcopy
    echo "✅ Pod '$pod' is copied"
end
