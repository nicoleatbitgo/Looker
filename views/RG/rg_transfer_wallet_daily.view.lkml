view: rg_transfer_wallet_daily {
  sql_table_name: "LOOKER"."RG_TRANSFER_WALLET_DAILY"
    ;;

  dimension_group: analytics_insert_date_pdt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ANALYTICS_INSERT_DATE_PDT" ;;
  }

  measure: blockchain_fees_coins {
    type: sum
    sql: ${TABLE}."BLOCKCHAIN_FEES_COINS" ;;
  }

  measure: blockchain_fees_usd {
    type: sum
    sql: ${TABLE}."BLOCKCHAIN_FEES_USD" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  measure: inter_enterprise_transfer_final_no_coins {
    type: sum
    sql: ${TABLE}."INTER_ENTERPRISE_TRANSFER_FINAL_NO_COINS" ;;
  }

  measure: inter_enterprise_transfer_final_usd {
    type: sum
    sql: ${TABLE}."INTER_ENTERPRISE_TRANSFER_FINAL_USD" ;;
  }

  measure: inter_enterprise_transfer_final_val {
    type: sum
    sql: ${TABLE}."INTER_ENTERPRISE_TRANSFER_FINAL_VAL" ;;
  }

  measure: intra_enterprise_transfer_final_no_coins {
    type: sum
    sql: ${TABLE}."INTRA_ENTERPRISE_TRANSFER_FINAL_NO_COINS" ;;
  }

  measure: intra_enterprise_transfer_final_usd {
    type: sum
    sql: ${TABLE}."INTRA_ENTERPRISE_TRANSFER_FINAL_USD" ;;
  }

  measure: intra_enterprise_transfer_final_val {
    type: sum
    sql: ${TABLE}."INTRA_ENTERPRISE_TRANSFER_FINAL_VAL" ;;
  }

  measure: outside_bitgo_final_no_coins {
    type: sum
    sql: ${TABLE}."OUTSIDE_BITGO_FINAL_NO_COINS" ;;
  }

  measure: outside_bitgo_final_usd {
    type: sum
    sql: ${TABLE}."OUTSIDE_BITGO_FINAL_USD" ;;
  }

  measure: outside_bitgo_final_val {
    type: sum
    sql: ${TABLE}."OUTSIDE_BITGO_FINAL_VAL" ;;
  }

  measure: reward_no_coins {
    type: sum
    sql: ${TABLE}."REWARD_NO_COINS" ;;
  }

  measure: reward_usd {
    type: sum
    sql: ${TABLE}."REWARD_USD" ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}."TRANSACTION_TYPE" ;;
  }

  dimension_group: transfer {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."TRANSFER_DATE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: outside_bitgo_final_no_coins_dimension {
    hidden: yes
    type: number
   sql: ${TABLE}."OUTSIDE_BITGO_FINAL_NO_COINS" ;;
  }

  dimension: outside_bitgo_final_usd_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."OUTSIDE_BITGO_FINAL_USD" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: inflow_from_outside_Bitgo{
    type: sum
    sql: abs(${outside_bitgo_final_no_coins_dimension}) ;;
    filters: [type: "receive"]
    value_format: "#,##0"
  }

  measure: outflow_to_outside_Bitgo{
    type: sum
    sql: abs(${outside_bitgo_final_no_coins_dimension}) ;;
    filters: [type: "send"]
    value_format: "#,##0"
  }

  measure: inflow_to_outside_Bitgo_USD{
    type: sum
    sql: abs(${outside_bitgo_final_usd_dimension}) ;;
    filters: [type: "receive"]
    value_format: "$#,##0"
  }

  measure: outflow_to_outside_Bitgo_USD{
    type: sum
    sql: abs(${outside_bitgo_final_usd_dimension}) ;;
    filters: [type: "send"]
    value_format: "$#,##0"
  }
}
