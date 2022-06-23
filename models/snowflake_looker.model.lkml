connection: "snowflake_looker"

# include all the views

include: "/views/**/rg_wp_metrics.view"
include: "/views/cw_v2_coin_dash_bal.view.lkml"
include: "/views/cw_v2_coin_dash_inflow.view.lkml"
include: "/views/status_time.view.lkml"
include: "/views/*/*.view.lkml"

datagroup: snowflake_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_looker_default_datagroup

explore: rg_wp_metrics {}

#feawfewa


#Testing explore for the new structure
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
}

# Explores for V2 coin dash
explore: cw_v2_coin_dash_bal {
  label: "Coin Dash Balance"
}

explore: cw_v2_coin_dash_inflow {
  label: "Coin Dash Inflow/Outflow"
}

explore: cw_acct_level_bal {
  label: "Coin Dash Account"
}

explore: hp_transaction_count {
  label: "Transaction Count - Enterprise Level"
}

explore: hp_auto_debit {
  label: "Auto Debit Alert"
}

explore: hp_debit_information {
  label: "Debit Alert Information"
}

explore: aj_daily_coin {
  label: "Daily Coin"
}

explore: hp_customer_health_score {
  label: "Customer Health Score"
}

explore: hp_customer_health_score_with_auc {
  label: "Customer Health Score with Product Usage"
}

explore: rg_check {
  label: "RG Test"
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
