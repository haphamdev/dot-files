function get_k8s_container_logs -d "Get log of a container inside a K8s pod"
    # Args: n/namespace, p/pod, c/container
    # Read container log and redirect it to a temp file in the background job
    # Output: temp log file and the background job id

    argparse 'n/namespace=' 'p/pod=' 'c/container=' -- $argv

    if set -q _flag_namespace
        set arg_namespace '--namespace' $_flag_namespace
    end

    if not set -q _flag_pod
        err "Missing pod. Aborted"
        return 1
    end

    if set -q _flag_container
        set arg_container '--container' $_flag_container
    end

    set log_file_path ~/lnav-logs/$_flag_pod--$_flag_container.log
    kubectl logs -f pods/$_flag_pod $arg_container $arg_namespace > $log_file_path &
    set -l job_id (jobs -lp)
    echo $log_file_path $job_id 
end
