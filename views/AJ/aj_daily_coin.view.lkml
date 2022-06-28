view: aj_daily_coin {

  sql_table_name: "LOOKER"."AJ_DAILY_COIN"
    ;;

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}."BITGO_ORG" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: coin_amount {
    type: number
    sql: ${TABLE}."COIN_AMOUNT" ;;
  }

  dimension: coin_amount_adjusted {
    type: number
    sql: ${TABLE}."COIN_AMOUNT_ADJUSTED" ;;
  }

  dimension: day_dt {
    type: number
    sql: ${TABLE}."DAY_DT" ;;
  }

  dimension: mth_dt {
    type: number
    sql: ${TABLE}."MTH_DT" ;;
  }

  dimension: no_coins {
    type: number
    sql: ${TABLE}."NO_COINS" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: wbtc_flag_enterprise {
    type: string
    sql: ${TABLE}."WBTC_FLAG_ENTERPRISE" ;;
  }

  dimension: yr_dt {
    type: number
    sql: ${TABLE}."YR_DT" ;;
  }

  dimension: enterprise_name {
    type: string
    sql: ${TABLE}."ENTERPRISE_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: no_coins_sum {
    type: sum
    sql: ${no_coins} ;;
  }

  measure: coin_amount_sum {
    type: sum
    sql: ${coin_amount} ;;
  }

  measure: coin_amount_adjusted_sum {
    type: sum
    sql: ${coin_amount_adjusted} ;;
  }

}
