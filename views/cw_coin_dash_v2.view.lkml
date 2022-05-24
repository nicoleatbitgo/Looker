view: cw_coin_dash_v2 {
  sql_table_name: "LOOKER"."CW_COIN_DASH_v2"
    ;;

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: enterprise_balance {
    type: number
    sql: ${TABLE}."ENTERPRISE_BALANCE" ;;
    value_format:"$#,##0,,\" M\""
  }

  dimension: enterprise_coins {
    type: number
    sql: ${TABLE}."ENTERPRISE_COINS" ;;
    value_format: "#,##0"
  }

  dimension: enterprise_positive_wallets {
    type: number
    sql: ${TABLE}."ENTERPRISE_POSITIVE_WALLETS" ;;
  }

  dimension: enterprises {
    type: number
    sql: ${TABLE}."ENTERPRISES" ;;
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

  dimension: paygo_balance {
    type: number
    sql: ${TABLE}."PAYGO_BALANCE" ;;
    value_format:"$#,##0,,\" M\""
  }

  dimension: paygo_coins {
    type: number
    sql: ${TABLE}."PAYGO_COINS" ;;
    value_format: "#,##0"
  }

  dimension: paygo_wallets {
    type: number
    sql: ${TABLE}."PAYGO_WALLETS" ;;
  }

  dimension: positive_balance_enterprises {
    type: number
    sql: ${TABLE}."POSITIVE_BALANCE_ENTERPRISES" ;;
  }

  dimension: positive_paygo_wallets {
    type: number
    sql: ${TABLE}."POSITIVE_PAYGO_WALLETS" ;;
  }

  dimension: total_balance {
    type: number
    sql: ${TABLE}."TOTAL_BALANCE" ;;
    value_format: "$#,##0,,\" M\""
  }

  dimension: total_coins {
    type: number
    sql: ${TABLE}."TOTAL_COINS" ;;
    value_format: "#,##0"
  }

  dimension_group: week_ending {
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
    sql: ${TABLE}."WEEK_ENDING" ;;
  }

  dimension: week_end_date {
    type: string
    sql: ${week_ending_date} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: enterprises_cnt {
    type: sum
    sql: ${enterprises} ;;
  }

  measure: total_coin_cnt {
    type: sum
    sql: ${total_coins} ;;
    value_format: "#,##0"
  }

  measure: total_balance_usd {
    type: sum
    sql: ${total_balance} ;;
    value_format: "$#,##0,,\" M\""
  }

  measure: enterprise_coin_cnt {
    type: sum
    sql: ${enterprise_coins} ;;
    value_format: "#,##0"
  }

  measure: enterprise_balance_usd {
    type: sum
    sql: ${enterprise_balance} ;;
    value_format: "$#,##0,,\" M\""
  }

  measure: inflow_volume {
    type: sum
    sql: ${inflow} ;;
    value_format: "#,##0"
  }

  measure: outflow_volume {
    type: sum
    sql: ${outflow} ;;
    value_format: "#,##0"
  }
}