function getenv -d "Copy envariable from ./gradlew.local. It can be pasted to Intellij configuration"
    # get all export lines from docker environments
    set -l envs (
        set -l SHELL bash;
        minikube -p minikube docker-env |
            grep export |
            awk '{print($2)}' |
            tr '\n' ';'
    )

    # append with all export lines from gradlew.local
    set -l envs $envs(cat ./gradlew.local |
        grep export |
        awk '{print($2)}' |
        tr '\n' ';'
    )

    echo $envs | tr -d '"' | pbcopy
    echo "Environment variables are copied."
end
