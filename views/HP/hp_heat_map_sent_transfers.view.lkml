view: hp_heat_map_sent_transfers {
  sql_table_name: "LOOKER"."HP_HEAT_MAP_SENT_TRANSFERS"
    ;;

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: flag {
    type: string
    sql: ${TABLE}."FLAG" ;;
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
