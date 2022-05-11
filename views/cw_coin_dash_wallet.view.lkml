view: cw_coin_dash_wallet {
  sql_table_name: "LOOKER"."CW_COIN_DASH_WALLET"
    ;;

  dimension: balance {
    type: number
    sql: ${TABLE}."BALANCE" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: coin_balance {
    type: number
    sql: ${TABLE}."COIN_BALANCE" ;;
  }

  dimension: enterprise_wallet_coal {
    type: string
    sql: ${TABLE}."ENTERPRISE_WALLET_COAL" ;;
  }

  dimension: pos_wallet_flag {
    type: number
    sql: ${TABLE}."POS_WALLET_FLAG" ;;
  }

  dimension: type_flag {
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

  measure: total_coin_balance {
    type: sum
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_min {
    type: min
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_per25 {
    type: percentile
    percentile: 25
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_median {
    type: median
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_per75 {
    type: percentile
    percentile: 75
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_max {
    type: max
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

}
