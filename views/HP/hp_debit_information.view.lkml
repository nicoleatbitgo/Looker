view: hp_debit_information {
  sql_table_name: "LOOKER"."HP_DEBIT_INFORMATION"
    ;;

  dimension: custodial_debit {
    type: number
    sql: ${TABLE}."CUSTODIAL_DEBIT" ;;
  }

  dimension: custodial_debit_coins {
    type: number
    sql: ${TABLE}."CUSTODIAL_DEBIT_COINS" ;;
  }

  dimension: outside_bitgo_transfer {
    type: number
    sql: ${TABLE}."OUTSIDE_BITGO_TRANSFER" ;;
  }

  dimension: outside_bitgo_transfer_of_coins {
    type: number
    sql: ${TABLE}."OUTSIDE_BITGO_TRANSFER_OF_COINS" ;;
  }

  dimension: within_bitgo_transfer {
    type: number
    sql: ${TABLE}."WITHIN_BITGO_TRANSFER" ;;
  }

  dimension: within_bitgo_transfer_of_coins {
    type: number
    sql: ${TABLE}."WITHIN_BITGO_TRANSFER_OF_COINS" ;;
  }


  dimension: bitgo_org {
    type: string
    sql: ${TABLE}."BITGO_ORG" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }


  dimension_group: enterprise_datetime {
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
    sql: ${TABLE}."ENTERPRISE_DATETIME" ;;
  }

  dimension: enterprise_flag {
    type: string
    sql: ${TABLE}."ENTERPRISE_FLAG" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: enterprise_name {
    type: string
    sql: ${TABLE}."ENTERPRISE_NAME" ;;
  }

  dimension: kyc_state {
    type: string
    sql: ${TABLE}."KYC_STATE" ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
  }

  dimension_group: transaction_datetime {
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
    sql: ${TABLE}."TRANSACTION_DATETIME" ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}."TRANSACTION_ID" ;;
  }

  dimension: upfront_payment_status {
    type: string
    sql: ${TABLE}."UPFRONT_PAYMENT_STATUS" ;;
  }

  dimension_group: wallet_datetime {
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
    sql: ${TABLE}."WALLET_DATETIME" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: csm {
    type: string
    label: "CSM"
    sql: ${TABLE}."CSM" ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  measure: count {
    type: count
  }

# Created additionally

  measure: custodial_debit_sum {
    type: sum
    label: "Custodial Debit"
    sql: ${custodial_debit} ;;
  }

  measure: outside_bitgo_transfer_sum {
    type: sum
    label: "outside BitGo Transfer"
    sql: ${outside_bitgo_transfer} ;;
  }

  measure: within_bitgo_transfer_sum {
    type: sum
    label: "within BitGo Transfer"
    sql: ${within_bitgo_transfer} ;;
  }

  measure: custodial_debit_coins_sum {
    type: sum
    label: "Custodial Debit (#Coins)"
    sql: ${custodial_debit_coins} ;;
  }

  measure: within_bitgo_transfer_of_coins_sum{
    type: sum
    label: "within BitGo Transfer (#Coins)"
    sql: ${within_bitgo_transfer_of_coins} ;;
  }

  measure: outside_bitgo_transfer_of_coins_sum{
    type: sum
    label: "outside BitGo Transfer (#Coins)"
    sql: ${outside_bitgo_transfer_of_coins} ;;
  }
}
