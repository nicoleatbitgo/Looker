connection: "snowflake_looker"

# include all the views
include: "/views/**/eth_transfer.view"
include: "/views/**/rg_wp_metrics.view"
include: "/views/cw_coin_dash_v2.view.lkml"
include: "/views/cw_coin_dash_base.view.lkml"
include: "/views/cw_coin_dash_wallet.view.lkml"
include: "/views/*/*.view.lkml"

datagroup: snowflake_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_looker_default_datagroup

explore: rg_wp_metrics {}
explore: eth_transfer {}
#feawfewa



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
  label: "Debit Automation Alert"
}

explore: hp_auto_debit_transaction_details {
  label: "Debit Automation Transaction Details"
}


explore: alert_information {
  view_name: hp_auto_debit
  join: hp_auto_debit_transaction_details {
    sql_on: ${hp_auto_debit.transaction_id} = ${hp_auto_debit_transaction_details.transaction_id} ;;
    relationship: one_to_many
    type: left_outer #default is left outer join
  }
  sql_always_where: ${hp_auto_debit_transaction_details.transaction_datetime_time} between
  dateadd(hour, -4, current_timestamp()) and current_timestamp() ;;
}
