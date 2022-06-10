view: trade_dash_monthly {
  sql_table_name: "LOOKER"."TRADE_DASH_MONTHLY"
    ;;

  dimension: collateral_type {
    type: string
    sql: ${TABLE}."COLLATERAL_TYPE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  measure: fill_exchange_fees {
    type: sum
    sql: ${TABLE}."EXCHANGE_FEES" ;;
  }

  measure: fill_spreads {
    type: sum
    sql: ${TABLE}."SPREAD" ;;
  }

  measure: fill_talos_fees {
    type: sum
    sql: ${TABLE}."TALOS_FEES" ;;
  }

  measure: number_coins {
    type: sum
    sql: ${TABLE}."NUMBER_COINS" ;;
  }

  dimension: processing_status {
    type: string
    sql: ${TABLE}."PROCESSING_STATUS" ;;
  }

  dimension: settlement_status {
    type: string
    sql: ${TABLE}."SETTLEMENT_STATUS1" ;;
  }

  dimension: side {
    type: string
    sql: ${TABLE}."SIDE" ;;
  }

  dimension: trade_currency {
    type: string
    sql: ${TABLE}."TRADE_CURRENCY" ;;
  }

  dimension: trade_source {
    type: string
    sql: ${TABLE}."TRADE_SOURCE" ;;
  }

  measure: trade_volume {
    type: sum
    sql: ${TABLE}."QUOTE_QUANTITY" ;;
  }

  measure: trade_volume_spread {
    type: sum
    sql: ${TABLE}."QUOTE_QUANTITY_SPREAD" ;;
  }

  measure: no_orders {
    type: sum
    sql: ${TABLE}."NO_ORDERS" ;;
  }

  dimension: user_intent {
    type: string
    sql: ${TABLE}."USER_INTENT" ;;
  }

  dimension: ENTERPRISE_NAME {
    type: string
    sql: ${TABLE}."ENTERPRISE_NAME" ;;
  }

  dimension: EXCHANGE_NAME {
    type: string
    sql: ${TABLE}."EXCHANGE_NAME" ;;
  }

  dimension_group: trade_date {
    type: time
    timeframes: [date,month,week,year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."TRADE_DATE" ;;
  }

  dimension_group: post_date {
    type: time
    timeframes: [date,month,week,year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."POST_DATE1" ;;
  }

  dimension_group: CREATION_DATE {
    type: time
    timeframes: [date,month,week,year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATION_DATE1" ;;
  }

  dimension_group: COMPLETION_DATE {
    type: time
    timeframes: [raw,date,month,week,year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."COMPLETION_DATE1" ;;
  }

  dimension: is_last_day_of_month {
    hidden: yes
    type: yesno
    sql: dayofmonth(DATEADD(day,1,${COMPLETION_DATE_date}) ) = 1 ;;
  }

  dimension: is_last_day_of_week {
    hidden: yes
    type: yesno
    sql: dayofweek(DATEADD(day,1,${COMPLETION_DATE_date})) = 1 ;;
  }


  parameter: date_granularity {
    type: string
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Year" }
  }

  dimension: date {
    type: date
    label_from_parameter: date_granularity
    sql:
        CASE
          WHEN {% parameter date_granularity %} = 'Day' THEN ${COMPLETION_DATE_date}
          WHEN {% parameter date_granularity %} = 'Week' THEN ${COMPLETION_DATE_week}
          WHEN {% parameter date_granularity %} = 'Month' THEN ${COMPLETION_DATE_month}
          WHEN {% parameter date_granularity %} = 'Year' THEN ${COMPLETION_DATE_year}
        END ;;
   }
}
