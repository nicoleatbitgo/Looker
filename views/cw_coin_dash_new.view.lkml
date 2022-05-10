view: cw_coin_dash_new {
  sql_table_name: "LOOKER"."CW_COIN_DASH_NEW"
    ;;

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: enterprise_balance {
    type: number
    sql: ${TABLE}."ENTERPRISE_BALANCE" ;;
  }

  dimension: enterprise_coins {
    type: number
    sql: ${TABLE}."ENTERPRISE_COINS" ;;
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
  }

  dimension: outflow {
    type: number
    sql: ${TABLE}."OUTFLOW" ;;
  }

  dimension: paygo_balance {
    type: number
    sql: ${TABLE}."PAYGO_BALANCE" ;;
  }

  dimension: paygo_coins {
    type: number
    sql: ${TABLE}."PAYGO_COINS" ;;
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
  }

  dimension: total_coins {
    type: number
    sql: ${TABLE}."TOTAL_COINS" ;;
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
}
