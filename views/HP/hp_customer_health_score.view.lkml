view: hp_customer_health_score {
  sql_table_name: "LOOKER"."HP_CUSTOMER_HEALTH_SCORE"
    ;;

  dimension: account_tier {
    type: string
    sql: ${TABLE}."ACCOUNT_TIER" ;;
  }

  dimension: auc {
    type: number
    sql: ${TABLE}."AUC" ;;
  }

  dimension: avg_days_overdue {
    type: number
    sql: ${TABLE}."AVG_DAYS_OVERDUE" ;;
  }

  dimension: avg_firstresponsehour {
    type: number
    sql: ${TABLE}."AVG_FIRSTRESPONSEHOUR" ;;
  }

  dimension: avg_resolutionhour_jira {
    type: number
    sql: ${TABLE}."AVG_RESOLUTIONHOUR_JIRA" ;;
  }

  dimension: avg_resolutionhour_wo_jira {
    type: number
    sql: ${TABLE}."AVG_RESOLUTIONHOUR_WO_JIRA" ;;
  }

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}."BITGO_ORG" ;;
  }

  dimension: csm {
    type: string
    sql: ${TABLE}."CSM" ;;
  }

  dimension: csm_health_score {
    type: number
    sql: ${TABLE}."CSM_HEALTH_SCORE" ;;
  }

  dimension: customer_health_score {
    type: number
    sql: ${TABLE}."CUSTOMER_HEALTH_SCORE" ;;
  }

  dimension: days_overdue_score {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE_SCORE" ;;
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

  dimension: enterprise_name {
    type: string
    sql: ${TABLE}."ENTERPRISE_NAME" ;;
  }

  dimension: final_score {
    type: number
    sql: ${TABLE}."FINAL_SCORE" ;;
  }

  dimension: firstresponse_score {
    type: number
    sql: ${TABLE}."FIRSTRESPONSE_SCORE" ;;
  }

  dimension: invoice_count {
    type: number
    sql: ${TABLE}."INVOICE_COUNT" ;;
  }

  dimension: invoice_count_score {
    type: number
    sql: ${TABLE}."INVOICE_COUNT_SCORE" ;;
  }

  dimension: invoice_payment_score_total {
    type: number
    sql: ${TABLE}."INVOICE_PAYMENT_SCORE_TOTAL" ;;
  }

  dimension: kyc_state {
    type: string
    sql: ${TABLE}."KYC_STATE" ;;
  }

  dimension: licenses {
    type: string
    sql: ${TABLE}."LICENSES" ;;
  }

  dimension: netsuite_id {
    type: string
    sql: ${TABLE}."NETSUITE_ID" ;;
  }

  dimension: org_salesforce_id {
    type: string
    sql: ${TABLE}."ORG_SALESFORCE_ID" ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}."ORGANIZATION_ID" ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
  }

  dimension: resolutionhour_jira_score {
    type: number
    sql: ${TABLE}."RESOLUTIONHOUR_JIRA_SCORE" ;;
  }

  dimension: resolutionhour_wo_jira_score {
    type: number
    sql: ${TABLE}."RESOLUTIONHOUR_WO_JIRA_SCORE" ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}."SALESFORCE_ID" ;;
  }

  dimension: score_segmentation {
    type: string
    sql: ${TABLE}."SCORE_SEGMENTATION" ;;
  }

  dimension: sent_transaction_count {
    type: number
    sql: ${TABLE}."SENT_TRANSACTION_COUNT" ;;
  }

  dimension: support_tickets_score_total {
    type: number
    sql: ${TABLE}."SUPPORT_TICKETS_SCORE_TOTAL" ;;
  }

  dimension: transaction_count {
    type: number
    sql: ${TABLE}."TRANSACTION_COUNT" ;;
  }

  dimension: upfront_payment_status {
    type: string
    sql: ${TABLE}."UPFRONT_PAYMENT_STATUS" ;;
  }

  dimension: wallet_count {
    type: number
    sql: ${TABLE}."WALLET_COUNT" ;;
  }

  # Measures
measure: auc_sum {
  type: sum
  label: "AUC"
  sql: ${auc} ;;
}

  measure: sent_transaction_count_sum {
    type: sum
    label: "Sent Transactions"
    sql: ${sent_transaction_count} ;;
  }

}
