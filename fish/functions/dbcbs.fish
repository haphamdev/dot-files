function dbcbs
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
    data-access sql execute-read-query "set personio.company_id to -1; select * from cb_customers where company_id=$COMPANY_ID" --db-identifier=chargebee-service --db-name=chargebee-service --jira-ticket=SM-981

    print_header "Subscription"
    data-access sql execute-read-query "set personio.company_id to -1; select cb_subscriptions.*, cb_plans.chargebee_plan_id from cb_subscriptions inner join cb_plans on cb_subscriptions.plan_id = cb_plans.id where company_id=$COMPANY_ID" --db-identifier=chargebee-service --db-name=chargebee-service --jira-ticket=SM-981

    print_header "Addons"
    data-access sql execute-read-query "set personio.company_id to -1; select * from cb_subscription_addons inner join cb_addons on cb_subscription_addons.addon_id = cb_addons.id where company_id=$COMPANY_ID" --db-identifier=chargebee-service --db-name=chargebee-service --jira-ticket=SM-981
end


