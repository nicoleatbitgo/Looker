view: cw_v2_coin_dash_inflow {

  sql_table_name: "LOOKER"."CW_V2_COIN_DASH_INFLOW"
    ;;

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: account_id {
    alias: [enterprise_wallet_coal]
    description: "Enterprise id for enterprises/ wallet id for paygo"
    type: string
    sql: ${TABLE}."ENTERPRISE_WALLET_COAL" ;;
  }

  dimension: inflow {
    type: number
    sql: ${TABLE}."INFLOW" ;;
    value_format: "#,##0"
  }

  dimension: outflow {
    type: number
    sql: ${TABLE}."OUTFLOW" ;;
    value_format: "#,##0"
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

  dimension: account_type{
    alias: [type_flag]
    type: string
    sql: ${TABLE}."TYPE_FLAG" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}. "BITGO_ORG" ;;
  }

  dimension: coin_group {
    type: string
    sql: ${TABLE}. "COIN_GROUP" ;;
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
    drill_fields: []
  }

  measure: inflow_amt {
    type: sum
    sql: ${inflow} ;;
#   value_format: "#,##0"
    value_format: "[>=1]#,##0;[>0]0.00;#,##0"
  }

  measure: outflow_amt {
    type: sum
    sql: ${outflow} ;;
#   value_format: "#,##0"
    value_format: "[>=1]#,##0;[>0]0.00;#,##0"
  }
}
