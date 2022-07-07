view: rg_enterprise_creation_weekly {
  sql_table_name: "LOOKER"."RG_ENTERPRISE_CREATION_WEEKLY"
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

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}."BITGO_ORG" ;;
  }

  dimension: canaccessborrowing {
    type: string
    sql: ${TABLE}."CANACCESSBORROWING" ;;
  }

  dimension: canaccesslending {
    type: string
    sql: ${TABLE}."CANACCESSLENDING" ;;
  }

  dimension: canaccesssettlement {
    type: string
    sql: ${TABLE}."CANACCESSSETTLEMENT" ;;
  }

  dimension: canaccesstrading {
    type: string
    sql: ${TABLE}."CANACCESSTRADING" ;;
  }

  dimension: cancreatecoldwallet {
    type: string
    sql: ${TABLE}."CANCREATECOLDWALLET" ;;
  }

  dimension: cancreatecustodialwallet {
    type: string
    sql: ${TABLE}."CANCREATECUSTODIALWALLET" ;;
  }

  dimension: cancreatehotwallet {
    type: string
    sql: ${TABLE}."CANCREATEHOTWALLET" ;;
  }

  dimension: cancreateoffchainwallet {
    type: string
    sql: ${TABLE}."CANCREATEOFFCHAINWALLET" ;;
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

  dimension: enterprise_flag {
    type: string
    sql: ${TABLE}."ENTERPRISE_FLAG" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: enterprise_name {
    type: string
    sql: ${TABLE}."ENTERPRISE_NAME" ;;
  }

  dimension_group: first_wallet_creation {
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
    sql: ${TABLE}."FIRST_WALLET_CREATION" ;;
  }

  dimension: kyc_state {
    type: string
    sql: ${TABLE}."KYC_STATE" ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}."ORGANIZATION_ID" ;;
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

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
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

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}."SALESFORCE_ID" ;;
  }

  dimension: send_active_30_d {
    type: number
    sql: ${TABLE}."SEND_ACTIVE_30D" ;;
  }

  dimension: send_active_7_d {
    type: number
    sql: ${TABLE}."SEND_ACTIVE_7D" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: upfront_payment_status {
    type: string
    sql: ${TABLE}."UPFRONT_PAYMENT_STATUS" ;;
  }

  measure: count {
    type: count
    drill_fields: [enterprise_name]
  }

  measure: number_enterprises {
    type: count_distinct
    filters: [enterprise_flag: "yes"]
    sql: ${TABLE}."ENTERPRISE_ID";;
  }

  measure: num_ent_with_wallet {
    type: count_distinct
    filters: [enterprise_flag: "yes",first_wallet_creation_date: "-NULL"]
    sql: ${TABLE}."ENTERPRISE_ID";;
  }

  measure: num_ent_pos_balance{
    type: count_distinct
    filters: [enterprise_flag: "yes",positive_balance: "1"]
    sql: ${TABLE}."ENTERPRISE_ID";;
  }

  dimension: 60d_ent_denom_flag {
    type: string
    sql: case when datediff(day,${enterprise_datetime_time},${refresh_date}) > 60 and
          datediff(day,${enterprise_datetime_time},${refresh_date}) <= 90
          then '1' else '0' end ;;
  }

  measure: 60d_act_num_ent {
    type: count_distinct
    filters: [60d_ent_denom_flag: "1"]
    sql: case when datediff(day,${enterprise_datetime_time},${activation_time})<=60 and
          datediff(day,${enterprise_datetime_time},${refresh_date}) > 60 and
          datediff(day,${enterprise_datetime_time},${refresh_date}) <= 90
          then ${enterprise_id} end;;
  }

  measure: 60d_act_den_ent {
    type: count_distinct
    filters: [60d_ent_denom_flag: "1"]
    sql: case when  datediff(day,${enterprise_datetime_time},${refresh_date}) > 60 and
          datediff(day,${enterprise_datetime_time},${refresh_date}) <= 90
          then ${enterprise_id} end;;
  }

  dimension: wallet_setup_base {
    type: string
    sql: case when datediff(day,${first_wallet_creation_time},${refresh_date}) <= 30
      and datediff(day,${first_wallet_creation_time},${refresh_date}) > 0 then 1 else 0 end ;;
  }

  measure: days_to_wallet_setup {
    type: median
    filters: [first_wallet_creation_time: "-NULL",wallet_setup_base: "1"]
    sql:  datediff(day,${enterprise_datetime_time},${first_wallet_creation_time});;
  }

  dimension: policy_setup_base {
    type: string
    sql: case when datediff(day,${policy_datetime_time},${refresh_date}) <= 30
      and datediff(day,${policy_datetime_time},${refresh_date}) > 0 then 1 else 0 end ;;
  }

  measure: days_to_policy_setup {
    type: median
    filters: [policy_datetime_time: "-NULL",policy_setup_base: "1"]
    sql:  datediff(day,${enterprise_datetime_time},${policy_datetime_time});;
  }

  dimension: activation_base {
    type: string
    sql: case when datediff(day,${activation_time},${refresh_date}) <= 30
      and datediff(day,${activation_time},${refresh_date}) > 0 then 1 else 0 end ;;
  }

  measure: days_to_activate {
    type: median
    filters: [activation_time: "-NULL",activation_base: "1"]
    sql:  datediff(day,${enterprise_datetime_time},${activation_time});;
  }

  measure: 7d_activity_num_ent {
    type: count_distinct
    filters: [enterprise_flag: "yes"]
    sql: case when ${send_active_7_d} = 1
          then ${enterprise_id} end;;
  }

  measure: 30d_activity_num_ent {
    type: count_distinct
    filters: [enterprise_flag: "yes"]
    sql: case when ${send_active_30_d} = 1
      then ${enterprise_id} end;;
  }
}
