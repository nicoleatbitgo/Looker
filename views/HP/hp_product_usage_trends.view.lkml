view: hp_product_usage_trends {
  sql_table_name: "LOOKER"."HP_PRODUCT_USAGE_TRENDS"
    ;;

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: account_tier {
    type: string
    sql: ${TABLE}."ACCOUNT_TIER" ;;
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

  dimension: csm {
    type: string
    label: "CSM"
    sql: ${TABLE}."CSM" ;;
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

  dimension: licenses {
    type: string
    sql: ${TABLE}."LICENSES" ;;
  }

  dimension: org_salesforce_id {
    type: string
    sql: ${TABLE}."ORG_SALESFORCE_ID" ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}."SALESFORCE_ID" ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}."ORGANIZATION_ID" ;;
  }

  dimension: first_wallet_id {
    type: string
    sql: ${TABLE}."FIRST_WALLET_ID" ;;
  }

  dimension: cheetah_id {
    type: string
    sql: ${TABLE}."CHEETAH_ID" ;;
  }

  dimension: received_coins {
    type: number
    sql: ${TABLE}."RECEIVED_COINS" ;;
  }

  dimension: received_transfers {
    type: number
    sql: ${TABLE}."RECEIVED_TRANSFERS" ;;
  }

  dimension: received_usd {
    type: number
    sql: ${TABLE}."RECEIVED_USD" ;;
  }

  dimension: sent_coins {
    type: number
    sql: ${TABLE}."SENT_COINS" ;;
  }

  dimension: sent_transfers {
    type: number
    sql: ${TABLE}."SENT_TRANSFERS" ;;
  }

  dimension: sent_usd {
    type: number
    sql: ${TABLE}."SENT_USD" ;;
  }

  dimension_group: transaction {
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
    sql: ${TABLE}."TRANSACTION_DATE" ;;
  }

  dimension_group: enterprise_creation {
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
    sql: ${TABLE}."ENTERPRISE_DATETIME" ;;
  }

  dimension_group: first_transaction {
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
    sql: ${TABLE}."FIRST_TRANSACTION_DATETIME" ;;
  }

  dimension_group: first_wallet_creation {
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
    sql: ${TABLE}."FIRST_WALLET_CREATION_DATETIME" ;;
  }

  dimension: upfront_payment_status {
    type: string
    sql: ${TABLE}."UPFRONT_PAYMENT_STATUS" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  parameter: date_granularity {
    type: string
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }

  dimension: date {
    type: string
    label_from_parameter: date_granularity
    sql:
    CASE
    WHEN {% parameter date_granularity %} = 'Day'   THEN ${transaction_date}
    WHEN {% parameter date_granularity %} = 'Week'  THEN last_day(to_date(${transaction_date}),'week')
    WHEN {% parameter date_granularity %} = 'Month' THEN last_day(to_date(${transaction_date}),'month')
    END ;;
  }

  dimension: enterprise {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
    link: {
      label: "Explore Enterprise Details"
      # url: "https://bitgoinc.cloud.looker.com/dashboards/32?Enterprise%20ID={{ value }}"
      url: "https://bitgoinc.cloud.looker.com/dashboards/32?Enterprise%20ID={{ _filters['enterprise_id'] | url_encode }}"
    }
  }

  measure: count {
    type: count
  }

  measure: sent_transfers_sum {
    type: sum
    label: "Sent Transfers"
    sql: ${sent_transfers} ;;
  }

  measure: sent_coins_sum {
    type: sum
    label: "Sent Coins"
    sql: ${sent_coins} ;;
  }

  measure: sent_usd_sum {
    type: sum
    label: "Sent USD"
    sql: ${sent_usd} ;;
  }

  measure: received_transfers_sum {
    type: sum
    label: "Received Transfers"
    sql: ${received_transfers} ;;
  }

  measure: received_coins_sum {
    type: sum
    label: "Received Coins"
    sql: ${received_coins} ;;
  }

  measure: received_usd_sum {
    type: sum
    label: "Received USD"
    sql: ${received_usd} ;;
  }

}
