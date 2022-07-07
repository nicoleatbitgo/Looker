connection: "snowflake_looker"

# include all the views

include: "/views/**/rg_wp_metrics.view"
include: "/views/status_time.view.lkml"
include: "/views/trust_wallet_balance_aging.view.lkml"
include: "/views/*/*.view.lkml"
include: "/dashboard/trust_rebalancing_dash.dashboard.lookml"

datagroup: snowflake_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_looker_default_datagroup

explore: rg_wp_metrics {}

#feawfewa


#Explore for the new lookml format
explore: ng_daily_wallet_balance {

  label: "Daily Wallet Balance"

 join: cw_coin_units_adj {
    type: left_outer
    sql_on: ${ng_daily_wallet_balance.coin} = ${cw_coin_units_adj.coin} ;;
    relationship: many_to_one
  }
  join: hp_enterprise_cleanup {
    type: left_outer
    sql_on: ${ng_daily_wallet_balance.enterprise_id} = ${hp_enterprise_cleanup.enterprise_id}  ;;
    relationship: many_to_one
  }
  join: hp_wallet_cleanup {
    type: left_outer
    sql_on: ${ng_daily_wallet_balance.wallet_id} =  ${hp_wallet_cleanup.wallet_id};;
    relationship: many_to_one
  }

  join: coin_top_ranking {
    type: inner
    relationship: many_to_one
    sql_on: ${ng_daily_wallet_balance.coin} = ${coin_top_ranking.coin};;
  }
}

explore: rg_enterprise_creation_weekly {

  label: "Weekly Enterprise Data"

  join: rg_wallet_creation_weekly {
    type: full_outer
    sql_on: ${rg_enterprise_creation_weekly.enterprise_id}=${rg_wallet_creation_weekly.enterprise_id};;
    relationship: one_to_many
  }
}

explore: transfer_cleanup {
  label: "Transfer Data"
  }

explore: trust_wallet_balance_aging {}


explore: cw_enterprise_level_balance {
  label: "Daily Enterprise Balance"
}

explore: hp_transaction_count {
  label: "Transaction Count - Enterprise Level"
}

# explore: hp_auto_debit {
#   label: "Auto Debit Alert"
# }

explore: hp_debit_information {
  label: "Debit Alert Information"
}

# explore: hp_historical_alerts {
#   label: "Historical Debit Alerts"
# }

explore: aj_daily_coin {
  label: "Daily Coin"
}

explore: hp_customer_health_score {
  label: "Customer Health Score"
}

explore: hp_customer_health_score_with_auc {
  label: "Customer Health Score with Product Usage"
}

explore: trade_dash_monthly {
  label: "RG trade_dash_monthly"
}

explore: hp_heat_map_sent_transfers {
  label: "Heat Map for Sent Transfers"
}

explore: hp_heat_map_wallet_balance {
  label: "Heat Map for Wallet Balance"
}

explore: hp_product_usage_trends {
  label: "Product Usage Trends"
}

explore: status_time {
  label: "Blockchain status time"
}

explore: txn_behav_7day {
  label: "Daily Wallet Transfers"

  join: rg_transfer_wallet_daily {
    type: left_outer
    sql_on: ${txn_behav_7day.transfer_date}=${rg_transfer_wallet_daily.transfer_date};;
    relationship: one_to_many
  }
}

explore: user_base {
  label: "User Data"
}
