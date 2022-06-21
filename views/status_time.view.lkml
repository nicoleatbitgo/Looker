view: status_time {

  sql_table_name: "LOOKER"."STATUS_TIME"
    ;;

  dimension: approved_flag {
    type: number
    sql: ${TABLE}."APPROVED_FLAG" ;;
  }

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}."BITGO_ORG" ;;
  }

  dimension: cnt {
    type: number
    sql: ${TABLE}."CNT" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: confirmed_flag {
    type: number
    sql: ${TABLE}."CONFIRMED_FLAG" ;;
  }

  dimension: created_confirmed_s {
    type: number
    sql: ${TABLE}."CREATED_CONFIRMED_S" ;;
  }

  dimension: created_signed_s {
    type: number
    sql: ${TABLE}."CREATED_SIGNED_S" ;;
  }

  dimension: enterprise_flag {
    type: string
    sql: ${TABLE}."ENTERPRISE_FLAG" ;;
  }

  dimension: mth_dt {
    type: number
    sql: ${TABLE}."MTH_DT" ;;
  }

  dimension: signed_confirmed_s {
    type: number
    sql: ${TABLE}."SIGNED_CONFIRMED_S" ;;
  }

  dimension: signed_flag {
    type: number
    sql: ${TABLE}."SIGNED_FLAG" ;;
  }

  dimension: transfer_type {
    type: string
    sql: ${TABLE}."TRANSFER_TYPE" ;;
  }

  dimension: week_dt {
    type: number
    sql: ${TABLE}."WEEK_DT" ;;
  }

  dimension: yr_dt {
    type: number
    sql: ${TABLE}."YR_DT" ;;
  }

  measure: count {
    type: sum
    sql: ${cnt} ;;
  }

  measure: created_confirmed_sum {
    type: sum
    sql: ${created_confirmed_s} ;;
  }




}
