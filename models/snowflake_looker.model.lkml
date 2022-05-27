connection: "snowflake_looker"

# include all the views

include: "/views/**/rg_wp_metrics.view"
include: "/views/cw_coin_dash_v2.view.lkml"
include: "/views/cw_coin_dash_base.view.lkml"
include: "/views/cw_coin_dash_wallet.view.lkml"
include: "/views/cw_v2_coin_dash_bal.view.lkml"
include: "/views/cw_v2_coin_dash_inflow.view.lkml"
include: "/cw_acct_level_bal.view.lkml"
include: "/views/*/*.view.lkml"

datagroup: snowflake_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_looker_default_datagroup

explore: rg_wp_metrics {}

#feawfewa

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

# Explores for v1 coin dash - will remove later
explore: cw_coin_dash_v2 {
  label: "Coin Dash Coin Level"
}



explore: cw_coin_dash_base {
  label: "Coin Dash Enterprise Level"
}

explore: cw_coin_dash_wallet {
  label: "Coin Dash Wallet Level"
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
