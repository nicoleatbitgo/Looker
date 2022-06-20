view: ng_daily_wallet_balance {
  sql_table_name: "ANALYTICS"."NG_DAILY_WALLET_BALANCE"
    ;;

  dimension_group: balance {
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
    sql: ${TABLE}."BALANCE_DATE" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: eod_balance {
    type: number
    sql: ${TABLE}."EOD_BALANCE" ;;
  }

  dimension: eod_norm_usd_balance {
    type: number
    sql: ${TABLE}."EOD_NORM_USD_BALANCE" ;;
  }

  dimension: eod_usd_balance {
    type: number
    sql: ${TABLE}."EOD_USD_BALANCE" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
