view: hp_auto_debit_transaction_details {
  sql_table_name: "LOOKER"."HP_AUTO_DEBIT_TRANSACTION_DETAILS"
    ;;

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

  measure: count {
    type: count
  }
}
