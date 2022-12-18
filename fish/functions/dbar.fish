function dbar -d "Send dbaccess request to EM"
    argparse 'h/help' 'c/company=' 'm/message=' 'a/approver=' 't/ticket=' -- $argv

    if set -q _flag_help
        echo "
        Send request to your EM to access database in prod environment.
        Please provide the input param as below. Missing params will need to be entered later.

        -h/--help:          Display help
        -c/--company:       Company ID which you need to query data.
        -m/--message:       Message or reason for the request.
        -a/--approver:      Email of the approver. Approver must be in Personio EM list.
        -t/--ticket:        The ticket that you are working go for auditing purpose
        "
        return
    end

    if set -q _flag_company
        echo "🔑 Company: " $_flag_company
    else
        read -P "🔑 Company: " _flag_company
    end

    if set -q _flag_ticket
        echo "❓ Ticket: " $_flag_ticket
    else
        read -P "❓ Ticket: " _flag_ticket
    end

    if test -z "$_flag_message"
        set _flag_message "I need to check the amount of document for company $_flag_company"
    end
    echo "💬 Message: $_flag_message"

    if test -z "$_flag_approver"
        set _flag_approver 'trung.truong.ext@personio.de'
    end
    echo "✅ Approver: $_flag_approver"

    set cmd "dbaccess request-company-access --company-id=\"$_flag_company\" --reason=\"$_flag_message\" --jira-ticket=\"$_flag_ticket\" --manager \"$_flag_approver\""
    echo "Command: $cmd"
    read -P "Send request? (y/n): " confirm

    if test $confirm = "y"
        eval $cmd
    else
        echo "Aborted!"
    end

end
