function dbsms
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

    print_header "Customer"
    data-access sql execute-read-query "set personio.company_id to -1; select * from customers where company_id=$COMPANY_ID" --db-identifier=subscription-management-service --db-name=subscription-management-service --jira-ticket=SM-981

    print_header "Subscription and plan"
    data-access sql execute-read-query "set personio.company_id to -1; select * from subscriptions inner join plans on plans.id = subscriptions.plan_id where company_id=$COMPANY_ID" --db-identifier=subscription-management-service --db-name=subscription-management-service --jira-ticket=SM-981

    print_header "Addons"
    data-access sql execute-read-query "set personio.company_id to -1; select * from subscription_addons inner join addons on subscription_addons.addon_id = addons.id where company_id=$COMPANY_ID" --db-identifier=subscription-management-service --db-name=subscription-management-service --jira-ticket=SM-981

    print_header "Recruiting option"
    data-access sql execute-read-query "set personio.company_id to -1; select recruiting_options.* from recruiting_options inner join subscriptions on subscriptions.recruiting_option_id = recruiting_options.id where company_id=$COMPANY_ID" --db-identifier=subscription-management-service --db-name=subscription-management-service --jira-ticket=SM-981
end
