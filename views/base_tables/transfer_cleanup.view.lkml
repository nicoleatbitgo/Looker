view: transfer_cleanup {
  sql_table_name: "LOOKER"."CW_TRANSFER_CLEANUP"
    ;;

  dimension: basevalue {
    type: string
    sql: ${TABLE}."BASEVALUE" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension_group: transfer {
    alias: [date]
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: feestring {
    type: string
    sql: ${TABLE}."FEESTRING" ;;
  }

  dimension: isreward {
    type: string
    sql: ${TABLE}."ISREWARD" ;;
  }

  dimension: no_coins {
    type: number
    sql: ${TABLE}."NO_COINS" ;;
  }

  dimension: paygofee {
    type: string
    sql: ${TABLE}."PAYGOFEE" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: transfer_id {
    type: string
    sql: ${TABLE}."TRANSFER_ID" ;;
  }

  dimension: txid {
    type: string
    sql: ${TABLE}."TXID" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: usd {
    type: string
    sql: ${TABLE}."USD" ;;
  }

  dimension: usdrate {
    type: string
    sql: ${TABLE}."USDRATE" ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}."VALUE" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: account_id {
    description: "Enterprise id for enterprises/ wallet id for paygo"
    type: string
    sql: case when ${enterprise_id} is null then ${wallet_id} else ${enterprise_id} end ;;
  }

  dimension: account_type {
    type: string
    sql: case when ${enterprise_id} is not null then 'Enterprise' else 'Paygo' end ;;
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
    WHEN {% parameter date_granularity %} = 'Day'   THEN ${transfer_date}
    WHEN {% parameter date_granularity %} = 'Week'  THEN last_day(to_date(${transfer_date}),'week')
    WHEN {% parameter date_granularity %} = 'Month' THEN last_day(to_date(${transfer_date}),'month')
    END ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: inflow {
    type: sum
    sql: ${no_coins} ;;
    filters: [type: "receive", state: "confirmed"]
    value_format: "#,##0"
  }

  measure: outflow {
    type: sum
    sql: abs(${no_coins}) ;;
    filters: [type: "send" , state: "confirmed"]
    value_format: "#,##0"
  }
}
