view: test_historical_debits {
  sql_table_name: "LOOKER"."TEST_HISTORICAL_DEBITS"
    ;;

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}."BITGO_ORG" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: csm {
    type: string
    sql: ${TABLE}."CSM" ;;
  }

  dimension: csm_number {
    type: number
    sql: ${TABLE}."CSM_NUMBER" ;;
  }

  dimension: custodial_debit {
    type: number
    sql: ${TABLE}."CUSTODIAL_DEBIT" ;;
  }

  dimension: custodial_debit_coins {
    type: number
    sql: ${TABLE}."CUSTODIAL_DEBIT_COINS" ;;
  }

  dimension: enterprise_datetime {
    type: string
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

  dimension: outside_bitgo_transfer {
    type: number
    sql: ${TABLE}."OUTSIDE_BITGO_TRANSFER" ;;
  }

  dimension: outside_bitgo_transfer_of_coins {
    type: number
    sql: ${TABLE}."OUTSIDE_BITGO_TRANSFER_OF_COINS" ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
  }

  dimension: transaction_datetime {
    type: string
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

  dimension: wallet_datetime {
    type: string
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

  dimension: within_bitgo_transfer {
    type: number
    sql: ${TABLE}."WITHIN_BITGO_TRANSFER" ;;
  }

  dimension: within_bitgo_transfer_of_coins {
    type: number
    sql: ${TABLE}."WITHIN_BITGO_TRANSFER_OF_COINS" ;;
  }

  measure: count {
    type: count
  }

  measure: csm_rank {
    type: sum
    sql:  ${csm_number};;
  }

  measure: custodial_debit_sum {
    type: sum
    sql: ${custodial_debit};;
  }
}
