view: wp_wallet_enterprise {
  sql_table_name: "LOOKER"."WP_WALLET_ENTERPRISE"
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

  dimension_group: activation_date_wallet {
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
    sql: ${TABLE}."ACTIVATION_DATE_WALLET" ;;
  }

  dimension: admin {
    type: number
    sql: ${TABLE}."ADMIN" ;;
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

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
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

  dimension: freeze {
    type: number
    sql: ${TABLE}."FREEZE" ;;
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

  dimension_group: policy_datetime_wallet {
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
    sql: ${TABLE}."POLICY_DATETIME_WALLET" ;;
  }

  dimension: positive_bal_wallet {
    type: number
    sql: ${TABLE}."POSITIVE_BAL_WALLET" ;;
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

  dimension_group: refresh_date_wallet {
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
    sql: ${TABLE}."REFRESH_DATE_WALLET" ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}."SALESFORCE_ID" ;;
  }

  dimension: send_act_30_d_wallet {
    type: number
    sql: ${TABLE}."SEND_ACT_30D_WALLET" ;;
  }

  dimension: send_act_7_d_wallet {
    type: number
    sql: ${TABLE}."SEND_ACT_7D_WALLET" ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: upfront_payment_status {
    type: string
    sql: ${TABLE}."UPFRONT_PAYMENT_STATUS" ;;
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

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [enterprise_name]
  }


  measure: num_enterprise {
    type: count_distinct
    sql: ${enterprise_id};;
  }

  measure: num_paygo_wallets {
    type: count_distinct
    sql: case when ${enterprise_id} is null then ${wallet_id} end;;
  }

  measure: num_enterprise_wallets {
    type: count_distinct
    sql: case when ${enterprise_id} is not null then ${wallet_id} end;;
  }

  measure: num_ent_act_wallets {
    type: count_distinct
    sql: case when ${enterprise_id} is not null and ${activation_date} is not null then ${wallet_id} end;;
  }

  measure: num_paygo_act_wallets {
    type: count_distinct
    sql: case when ${enterprise_id} is null and ${activation_date} is not null then ${wallet_id} end;;
  }

  measure: num_act_wallets {
    type: count_distinct
    sql: case when ${activation_date} is not null then ${wallet_id} end;;
  }

  measure: num_ent_with_wallets {
    type: count_distinct
    sql: case when ${wallet_id} is not null then ${enterprise_id} end;;
  }

  measure: num_ent_positive_bal {
    type: count_distinct
    sql: case when ${positive_balance}=1 then ${enterprise_id} end;;
  }

  dimension: 60d_ent_denom_flag {
    type: string
    sql: case when datediff(day,${enterprise_datetime_time},${refresh_date}) > 60 and
    datediff(day,${enterprise_datetime_time},${refresh_date}) <= 90
    then '1' else '0' end ;;
  }

  measure: 60d_act_num_ent {
    type: count_distinct
    sql: case when datediff(day,${enterprise_datetime_time},${activation_time})<=60 and
    datediff(day,${enterprise_datetime_time},${refresh_date}) > 60 and
    datediff(day,${enterprise_datetime_time},${refresh_date}) <= 90
    then ${enterprise_id} end;;
  }

  measure: 60d_act_den_ent {
    type: count_distinct
    sql: case when  datediff(day,${enterprise_datetime_time},${refresh_date}) > 60 and
    datediff(day,${enterprise_datetime_time},${refresh_date}) <= 90
    then ${enterprise_id} end;;
  }

  measure: 60d_act_rate_ent {
    type:sum_distinct
    sql_distinct_key: ${enterprise_id} ;;
    filters: [60d_ent_denom_flag: "1"]
    sql: ${60d_act_num_ent}/${60d_act_den_ent} ;;
    value_format: "0.0%"
  }

  dimension: wallet_setup_base {
    type: string
    sql: case when datediff(day,${wallet_datetime_time},${refresh_date}) <= 30
    and datediff(day,${wallet_datetime_time},${refresh_date}) > 0 then 1 else 0 end ;;
  }

  measure: days_to_wallet_setup {
    type: median_distinct
    sql_distinct_key: ${enterprise_id} ;;
    filters: [wallet_datetime_time: "-NULL",wallet_setup_base: "1"]
    sql:  datediff(day,${enterprise_datetime_time},${wallet_datetime_time});;
  }

  dimension: activation_base {
    type: string
    sql: case when datediff(day,${activation_time},${refresh_date}) <= 30
      and datediff(day,${activation_time},${refresh_date}) > 0 then 1 else 0 end ;;
  }

  measure: days_to_activation {
    type: median_distinct
    sql_distinct_key: ${enterprise_id} ;;
    filters: [activation_base: "1"]
    sql:  datediff(day,${enterprise_datetime_time},${activation_time});;
  }

  dimension: policy_setup_base {
    type: string
    sql: case when datediff(day,${policy_datetime_time},${refresh_date}) <= 30
      and datediff(day,${policy_datetime_time},${refresh_date}) > 0 then 1 else 0 end ;;
  }

  measure: days_to_setup_policy {
    type: median_distinct
    sql_distinct_key: ${enterprise_id} ;;
    filters: [policy_setup_base: "1"]
    sql:  datediff(day,${enterprise_datetime_time},${policy_datetime_time});;
  }
}
