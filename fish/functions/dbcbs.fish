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
    dbaccess execute-read-query "set personio.company_id to -1; select * from cb_customers where company_id=$COMPANY_ID" --db-identifier=chargebee-service --db-name=chargebee-service

    print_header "Subscription"
    dbaccess execute-read-query "set personio.company_id to -1; select * from cb_subscriptions where company_id=$COMPANY_ID" --db-identifier=chargebee-service --db-name=chargebee-service

    print_header "Addons"
    dbaccess execute-read-query "set personio.company_id to -1; select * from cb_subscription_addons inner join cb_addons on cb_subscription_addons.addon_id = cb_addons.id where company_id=$COMPANY_ID" --db-identifier=chargebee-service --db-name=chargebee-service
end


