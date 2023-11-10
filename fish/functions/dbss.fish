function dbss
    if test (count $argv) -gt 0
        set COMPANY_ID $argv[1]
        echo "🔑 Company: $COMPANY_ID"
    else
        read -P "🔑 Company: " COMPANY_ID
        if test -z "$COMPANY_ID"
            echo "Skipped"
            return
        end
    end

    print_header "Subscriptions"
    data-access sql execute-read-query "set personio.company_id to -1; select subscriptions.*, plans.type plan_type from subscriptions inner join plans on subscriptions.plan_id = plans.id where company_id = $COMPANY_ID" --db-identifier=subscription-service --jira-ticket=SM-981

    print_header "Addons"
    data-access sql execute-read-query "set personio.company_id to -1; select * from subscription_addons inner join addons on subscription_addons.addon_id = addons.id where company_id = $COMPANY_ID" --db-identifier=subscription-service --jira-ticket=SM-981
end
