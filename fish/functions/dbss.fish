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

    print_header "Companies"
    data-access sql execute-read-query "select * from companies" --db-identifier=subscription-service --company-id=$COMPANY_ID --jira-ticket=SM-981

    print_header "ChargeBee customers"
    data-access sql execute-read-query "select * from chargebee_customers" --db-identifier=subscription-service --company-id=$COMPANY_ID --jira-ticket=SM-981

    print_header "ChargeBee subscriptions"
    data-access sql execute-read-query "select subscriptions.*, chargebee_subscriptions.chargebee_subscription_id from subscriptions inner join chargebee_subscriptions on subscriptions.id = chargebee_subscriptions.subscription_id" --db-identifier=subscription-service --company-id=$COMPANY_ID --jira-ticket=SM-981

    print_header "Addons"
    data-access sql execute-read-query "select * from subscription_addons inner join addons on subscription_addons.addon_id = addons.id" --company-id=$COMPANY_ID --db-identifier=subscription-service --jira-ticket=SM-981
end
