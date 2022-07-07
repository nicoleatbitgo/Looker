view: user_base {
  sql_table_name: "LOOKER"."USER_BASE"
    ;;

  dimension_group: refresh {
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
    sql: ${TABLE}."REFRESH_DATE" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: positive_bal_flag {
    type: string
    sql: ${TABLE}."POSITIVE_BAL_FLAG" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: number_users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: number_wallets {
    type: count_distinct
    sql: ${wallet_id} ;;
  }

  measure: positive_bal_users{
    type: count_distinct
    filters: [positive_bal_flag: "1"]
    sql: ${user_id} ;;
  }
}
