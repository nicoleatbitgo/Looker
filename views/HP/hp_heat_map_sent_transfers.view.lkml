view: hp_heat_map_sent_transfers {

  sql_table_name: "LOOKER"."HP_HEAT_MAP_SENT_TRANSFERS"
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

  dimension: wallet_coin {
    type: string
    sql: ${TABLE}."WALLET_COIN" ;;
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

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: enterprise_name {
    type: string
    sql: ${TABLE}."ENTERPRISE_NAME" ;;
  }

  dimension: flag {
    type: string
    sql: ${TABLE}."FLAG" ;;
  }

  dimension: kyc_state {
    type: string
    sql: ${TABLE}."KYC_STATE" ;;
  }

  dimension: licenses {
    type: string
    sql: ${TABLE}."LICENSES" ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
  }

  dimension: sent_transfers {
    type: number
    sql: ${TABLE}."SENT_TRANSFERS" ;;
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

  measure: count {
    type: count
  }

  measure: sent_transfers_sum {
    type: sum
    label: "Sent Transfers"
    sql: ${sent_transfers} ;;
  }
}
