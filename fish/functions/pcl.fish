# Clone project to $HOME/projects directory
function pcl -d "Clone git project to $HOME/projects"
    set -l action $argv[1]
    set -l url $argv[2]
    set -l proj_name (basename $url .git)
    set -l help_msg "Clone git project to $HOME/projects. Available actions:
        - e v vim nvim: Open the cloned project dir by Neo Vim
        - c code vscode: Open the cloned project dir by VS Code
        - b back: Stay in current directory and not open the project"

    switch $action
        case e v vim nvim
            cd $HOME/projects
            git clone $url
            nvim $proj_name
        case c code vscode
            cd $HOME/projects
            git clone $url
            code $proj_name
        case b back
            cd $HOME/projects
            git clone $url
            cd -
        case help
            echo $help_msg
        case '*'
            echo "Invalid action.\n" $help_msg
        end
end
