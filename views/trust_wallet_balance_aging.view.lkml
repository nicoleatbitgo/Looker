view: trust_wallet_balance_aging {
  sql_table_name: "LOOKER"."TRUST_WALLET_BALANCE_AGING"
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

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}."BITGO_ORG" ;;
  }

  dimension: days_over_100_mn {
    hidden: yes
    type: number
    sql: ${TABLE}."DAYS_OVER_100MN" ;;
  }

  dimension: days_over_150_mn {
    hidden: yes
    type: number
    sql: ${TABLE}."DAYS_OVER_150MN" ;;
  }

  dimension: days_over_200_mn {
    hidden: yes
    type: number
    sql: ${TABLE}."DAYS_OVER_200MN" ;;
  }

  dimension: days_over_250_mn {
    hidden: yes
    type: number
    sql: ${TABLE}."DAYS_OVER_250MN" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: enterprise_name {
    type: string
    sql: ${TABLE}."ENTERPRISE_NAME" ;;
  }

  dimension: eod_balance {
    type: number
    sql: ${TABLE}."EOD_BALANCE" ;;
    value_format: "#,##0"
  }

  dimension: eod_norm_usd_balance {
    type: number
    sql: ${TABLE}."EOD_NORM_USD_BALANCE" ;;
    value_format: "$#,##0"
  }

  dimension: eod_usd_balance {
    type: number
    sql: ${TABLE}."EOD_USD_BALANCE" ;;
    value_format: "$#,##0"
  }

  dimension: wallet_coin {
    type: string
    sql: ${TABLE}."WALLET_COIN" ;;
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
    drill_fields: [enterprise_name]
  }

  measure: days_over_100mn {
    type: sum
    sql: ${days_over_100_mn} ;;
  }

 measure: days_over_150mn {
    type: sum
    sql: ${days_over_150_mn} ;;
  }

  measure: days_over_200mn {
    type: sum
    sql: ${days_over_200_mn} ;;
  }

  measure: days_over_250mn {
    type: sum
    sql: ${days_over_250_mn} ;;
  }

}
