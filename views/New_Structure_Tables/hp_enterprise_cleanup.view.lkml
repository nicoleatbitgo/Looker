view: hp_enterprise_cleanup {
  required_access_grants: [can_view]
  sql_table_name: "ANALYTICS"."HP_ENTERPRISE_CLEANUP"
    ;;

  dimension: auto_id {
    type: number
    sql: ${TABLE}."AUTO_ID" ;;
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

  dimension: cheetah_id {
    type: string
    sql: ${TABLE}."CHEETAH_ID" ;;
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

  dimension: feature_flag {
    type: string
    sql: ${TABLE}."FEATURE_FLAG" ;;
  }

  dimension: kyc_state {
    type: string
    sql: ${TABLE}."KYC_STATE" ;;
  }

  dimension: licenses {
    type: string
    sql: ${TABLE}."LICENSES" ;;
  }

  dimension: onreact_flag {
    type: number
    sql: ${TABLE}."ONREACT_FLAG" ;;
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

  dimension: org_salesforce_id {
    type: string
    sql: ${TABLE}."ORG_SALESFORCE_ID" ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}."ORGANIZATION_ID" ;;
  }

  dimension: payload {
    type: string
    sql: ${TABLE}."PAYLOAD" ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}."SALESFORCE_ID" ;;
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

  dimension: upfront_payment_status {
    type: string
    sql: ${TABLE}."UPFRONT_PAYMENT_STATUS" ;;
  }

  dimension: enterprise {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
    link: {
      label: "Explore Enterprise Details"
      url: "https://bitgoinc.cloud.looker.com/dashboards/31?Enterprise+ID={{ value }}"
    }
  }

  measure: count {
    type: count
    drill_fields: [enterprise_name]
  }
}
