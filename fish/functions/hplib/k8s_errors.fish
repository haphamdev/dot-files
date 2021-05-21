function k8s_errors -d "Return the error code for the error name"
    # Args: error name
    set -l error_name $argv[1]

    switch $error_name
        case POD_MISSING
            echo 1
        case POD_NOT_FOUND
            echo 2
        case NAMESPACE_NOT_FOUND
            echo 3
        case CONTAINER_NOT_FOUND
            echo 4
        case CONTAINER_MISSING
            echo 5
        case PORT_MISSING
            echo 6

        case NOT_ENOUGH_ARGUMENT
            echo 200

        case '*'
            echo 255
    end
end
