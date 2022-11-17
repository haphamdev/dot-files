function dbaq -d "Query database from stage or prod environment"
    argparse 'h/help' 'c/company=' 'm/message=' 'a/approver=' 'r/reviewer=' 't/ticket=' 's/stage' -- $argv

    if set -q _flag_help
        echo "
        Run database query to fetch data from Stage or Production environment
        Please provide the input param as below. Missing params will need to be entered later.

        -h/--help:          Display help
        -c/--company:       Company ID which you need to query data.
        -i/--instance:      Message or reason for the request.
        -d/--database:      Email of the approver. Approver must be in Personio EM list.
        -s/--stage:         Query data from STAGE. Otherwise, query data from PRODUCTION
        "
        return
    end

    if set -q _flag_company
        echo "🔑 Company: " $_flag_company
    else
        read -P "🔑 Company: " _flag_company
    end

    if set -q _flag_instance
        echo "❓ Instance: " $_flag_instance
    else
        read -P "❓ Instance: " _flag_instance
    end

    if set -q _flag_database
        echo "💬 Database: $_flag_database"
    else
        read -P "💬 Database: " _flag_database
    end

    if set -q _flag_stage
        set env stage
    else
        set env prod
    end
    echo "🖥 Environment: $env"


    dbaccess execute-query "select * from scheduled_deletions where company_id=1935" --company-id=1935 --instance=microservices-prod --db=company-data-operations-service --env=prod

end

