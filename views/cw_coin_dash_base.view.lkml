view: cw_coin_dash_base {
  sql_table_name: "LOOKER"."CW_COIN_DASH_BASE"
    ;;

  dimension: balance {
    type: number
    sql: ${TABLE}."BALANCE" ;;
  }

  dimension: bitgoorg {
    type: string
    sql: ${TABLE}."BITGOORG" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: coin_balance {
    type: number
    sql: ${TABLE}."COIN_BALANCE" ;;
    value_format: "#,##0.00"
  }

  dimension: coin_balance_bin {
    type: bin
    bins: [0, 50 ,100, 500,1000, 2000, 3000, 4000, 5000, 10000]
    style: interval
    sql: ${coin_balance} ;;
    value_format: "0"
  }

  dimension: enterprise_wallet_coal {
    type: string
    sql: ${TABLE}."ENTERPRISE_WALLET_COAL" ;;
  }

  dimension: no_positive_wallets_thiswk {
    type: number
    sql: ${TABLE}."NO_POSITIVE_WALLETS_THISWK" ;;
  }

  dimension: type_flag {
    type: string
    sql: ${TABLE}."TYPE_FLAG" ;;
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

  measure: account_cnt {
    type: count_distinct
    sql: ${enterprise_wallet_coal} ;;
  }
}
