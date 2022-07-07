view: rg_wallet_creation_weekly {
  sql_table_name: "LOOKER"."RG_WALLET_CREATION_WEEKLY"
    ;;

  dimension_group: activation {
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
    sql: ${TABLE}."ACTIVATION_DATE" ;;
  }

  dimension: admin {
    type: number
    sql: ${TABLE}."ADMIN" ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: deleted_flag {
    type: string
    sql: ${TABLE}."DELETED_FLAG" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: freeze {
    type: number
    sql: ${TABLE}."FREEZE" ;;
  }

  dimension_group: policy_datetime {
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
    sql: ${TABLE}."POLICY_DATETIME" ;;
  }

  dimension: positive_balance {
    type: number
    sql: ${TABLE}."POSITIVE_BALANCE" ;;
  }

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

  dimension: send_active_30_d {
    type: number
    sql: ${TABLE}."SEND_ACTIVE_30D" ;;
  }

  dimension: send_active_7_d {
    type: number
    sql: ${TABLE}."SEND_ACTIVE_7D" ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}."SPEND" ;;
  }

  dimension: view {
    type: number
    sql: ${TABLE}."VIEW" ;;
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

  measure: number_wallets {
    type: count_distinct
    sql: ${TABLE}."WALLET_ID";;
  }

  measure: number_enterprises {
    type: count_distinct
    sql: ${TABLE}."ENTERPRISE_ID";;
  }

  measure: num_paygo_wallet {
    type: count_distinct
    filters: [enterprise_id: "NULL"]
    sql: ${TABLE}."WALLET_ID";;
  }

  measure: num_enterprise_wallet {
    type: count_distinct
    filters: [enterprise_id: "-NULL"]
    sql: ${TABLE}."WALLET_ID";;
  }

  measure: num_activated_wallet {
    type: count_distinct
    filters: [activation_date: "-NULL"]
    sql: ${TABLE}."WALLET_ID";;
  }

  measure: num_activated_enterprise_wallet {
    type: count_distinct
    filters: [activation_date: "-NULL",enterprise_id: "-NULL"]
    sql: ${TABLE}."WALLET_ID";;
  }

  measure: num_activated_paygo_wallet {
    type: count_distinct
    filters: [activation_date: "-NULL",enterprise_id: "NULL"]
    sql: ${TABLE}."WALLET_ID";;
  }

  measure: num_wallets_pos_balance{
    type: count_distinct
    filters: [positive_balance: "1"]
    sql: ${TABLE}."WALLET_ID";;
  }

  dimension: 60d_wallet_denom_flag {
    type: string
    sql: case when datediff(day,${wallet_datetime_time},${refresh_date}) > 60 and
          datediff(day,${wallet_datetime_time},${refresh_date}) <= 90
          then '1' else '0' end ;;
  }

  measure: 60d_act_num_wallet {
    type: count_distinct
    filters: [60d_wallet_denom_flag: "1"]
    sql: case when datediff(day,${wallet_datetime_time},${activation_time})<=60 and
          datediff(day,${wallet_datetime_time},${refresh_date}) > 60 and
          datediff(day,${wallet_datetime_time},${refresh_date}) <= 90
          then ${wallet_id} end;;
  }

  measure: 60d_act_den_wallet {
    type: count_distinct
    filters: [60d_wallet_denom_flag: "1"]
    sql: case when  datediff(day,${wallet_datetime_time},${refresh_date}) > 60 and
          datediff(day,${wallet_datetime_time},${refresh_date}) <= 90
          then ${wallet_id} end;;
  }

  dimension: policy_setup_base {
    type: string
    sql: case when datediff(day,${policy_datetime_time},${refresh_date}) <= 30
      and datediff(day,${policy_datetime_time},${refresh_date}) > 0 then 1 else 0 end ;;
  }

  measure: days_to_policy_setup {
    type: median
    filters: [policy_datetime_time: "-NULL",policy_setup_base: "1"]
    sql:  datediff(day,${wallet_datetime_time},${policy_datetime_time});;
  }

  dimension: activation_base {
    type: string
    sql: case when datediff(day,${activation_time},${refresh_date}) <= 30
      and datediff(day,${activation_time},${refresh_date}) > 0 then 1 else 0 end ;;
  }

  measure: days_to_activate {
    type: median
    filters: [activation_time: "-NULL",activation_base: "1"]
    sql:  datediff(day,${wallet_datetime_time},${activation_time});;
  }

  measure: 7d_activity_num_ent {
    type: count_distinct
    sql: case when ${send_active_7_d} = 1
      then ${wallet_id} end;;
  }

  measure: 30d_activity_num_ent {
    type: count_distinct
    sql: case when ${send_active_30_d} = 1
      then ${wallet_id} end;;
  }
}
