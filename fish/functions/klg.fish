function klg -d "Get log of a pod (container if needed)"
    argparse 'n/namespace=' 'c/container=' -- $argv

    if test $status -ne 0
        return 255
    end

    if test (count $argv) -eq 0
        err "Pod is missing"
        return (k8s_errors POD_MISSING)
    end

    if set -q _flag_namespace
        set -l namespace (get_k8s_namespace $_flag_namespace)
        set arg_namespace '-n' $namespace
    end

    if test $status -ne 0
        err "Namespace not found." 
        return (k8s_errors NAMESPACE_NOT_FOUND)
    end

    set pod (get_k8s_pod $arg_namespace $argv[1])
    set arg_pod '-p' $pod

    if test $status -ne 0
        err "Pod not found"
        return (k8s_errors POD_NOT_FOUND)
    end

    set -l container (get_k8s_container $arg_namespace $arg_pod $_flag_container)
    set arg_container '-c' $container

    if test $status -ne 0
        err "Container not found."
        return (k8s_errors CONTAINER_NOT_FOUND)
    end

    breakpoint
    set result (get_k8s_container_logs $arg_namespace $arg_pod $arg_container | string split ' ')

    set -l log_file_path $result[1]
    set -l job_id $result[2]

    echo \uf0f6 Opening the log file $log_file_path
    lnav $log_file_path
    kill $job_id
    echo \uf014 Removing log file $log_file_path
    rm $log_file_path
end
