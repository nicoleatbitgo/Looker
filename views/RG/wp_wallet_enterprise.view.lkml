view: wp_wallet_enterprise {
  sql_table_name: "LOOKER"."WP_WALLET_ENTERPRISE"
    ;;

  dimension_group: activation {
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
    sql: ${TABLE}."ACTIVATION_DATE" ;;
  }

  dimension_group: activation_date_wallet {
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
    sql: ${TABLE}."ACTIVATION_DATE_WALLET" ;;
  }

  dimension: admin {
    type: number
    sql: ${TABLE}."ADMIN" ;;
  }

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}."BITGO_ORG" ;;
  }

  dimension: canaccessborrowing {
    type: string
    sql: ${TABLE}."CANACCESSBORROWING" ;;
  }

  dimension: canaccesslending {
    type: string
    sql: ${TABLE}."CANACCESSLENDING" ;;
  }

  dimension: canaccesssettlement {
    type: string
    sql: ${TABLE}."CANACCESSSETTLEMENT" ;;
  }

  dimension: canaccesstrading {
    type: string
    sql: ${TABLE}."CANACCESSTRADING" ;;
  }

  dimension: cancreatecoldwallet {
    type: string
    sql: ${TABLE}."CANCREATECOLDWALLET" ;;
  }

  dimension: cancreatecustodialwallet {
    type: string
    sql: ${TABLE}."CANCREATECUSTODIALWALLET" ;;
  }

  dimension: cancreatehotwallet {
    type: string
    sql: ${TABLE}."CANCREATEHOTWALLET" ;;
  }

  dimension: cancreateoffchainwallet {
    type: string
    sql: ${TABLE}."CANCREATEOFFCHAINWALLET" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: deleted_flag {
    type: string
    sql: ${TABLE}."DELETED_FLAG" ;;
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

  dimension_group: first_wallet_creation {
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
    sql: ${TABLE}."FIRST_WALLET_CREATION" ;;
  }

  dimension: freeze {
    type: number
    sql: ${TABLE}."FREEZE" ;;
  }

  dimension: kyc_state {
    type: string
    sql: ${TABLE}."KYC_STATE" ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}."ORGANIZATION_ID" ;;
  }

  dimension_group: policy_datetime {
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
    sql: ${TABLE}."POLICY_DATETIME" ;;
  }

  dimension_group: policy_datetime_wallet {
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
    sql: ${TABLE}."POLICY_DATETIME_WALLET" ;;
  }

  dimension: positive_bal_wallet {
    type: number
    sql: ${TABLE}."POSITIVE_BAL_WALLET" ;;
  }

  dimension: positive_balance {
    type: number
    sql: ${TABLE}."POSITIVE_BALANCE" ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
  }

  dimension_group: refresh {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."REFRESH_DATE" ;;
  }

  dimension_group: refresh_date_wallet {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."REFRESH_DATE_WALLET" ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}."SALESFORCE_ID" ;;
  }

  dimension: send_act_30_d_wallet {
    type: number
    sql: ${TABLE}."SEND_ACT_30D_WALLET" ;;
  }

  dimension: send_act_7_d_wallet {
    type: number
    sql: ${TABLE}."SEND_ACT_7D_WALLET" ;;
  }

  dimension: send_active_30_d {
    type: number
    sql: ${TABLE}."SEND_ACTIVE_30D" ;;
  }

  dimension: send_active_7_d {
    type: number
    sql: ${TABLE}."SEND_ACTIVE_7D" ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}."SPEND" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: upfront_payment_status {
    type: string
    sql: ${TABLE}."UPFRONT_PAYMENT_STATUS" ;;
  }

  dimension: view {
    type: number
    sql: ${TABLE}."VIEW" ;;
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

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [enterprise_name]
  }


  measure: num_enterprise {
    type: count_distinct
    sql: ${enterprise_id};;
  }

  measure: num_act_enterprise {
    type: count_distinct
    sql: case when ${activation_date} is not null then ${enterprise_id} end;;

  }
}
