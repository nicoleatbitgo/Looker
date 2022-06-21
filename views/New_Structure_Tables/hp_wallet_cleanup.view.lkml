view: hp_wallet_cleanup {
  required_access_grants: [can_view]
  sql_table_name: "ANALYTICS"."HP_WALLET_CLEANUP"
    ;;

  dimension: admin {
    type: number
    sql: ${TABLE}."ADMIN" ;;
  }

  dimension: auto_id {
    type: number
    sql: ${TABLE}."AUTO_ID" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension_group: dbz_create {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DBZ_CREATE_DATE" ;;
  }

  dimension: deleted_flag {
    type: string
    sql: ${TABLE}."DELETED_FLAG" ;;
  }

  dimension_group: enterprise_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ENTERPRISE_DATETIME" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: freeze {
    type: number
    sql: ${TABLE}."FREEZE" ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}."LABEL" ;;
  }

  dimension: migrated_from {
    type: string
    sql: ${TABLE}."MIGRATED_FROM" ;;
  }

  dimension_group: op_log {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."OP_LOG_DATE" ;;
  }

  dimension: payload {
    type: string
    sql: ${TABLE}."PAYLOAD" ;;
  }

  dimension_group: snowflake_insert {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SNOWFLAKE_INSERT_DATE" ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}."SPEND" ;;
  }

  dimension: view {
    type: number
    sql: ${TABLE}."VIEW" ;;
  }

  dimension: viewer {
    type: number
    sql: ${TABLE}."VIEWER" ;;
  }

  dimension_group: wallet_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."WALLET_DATETIME" ;;
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
