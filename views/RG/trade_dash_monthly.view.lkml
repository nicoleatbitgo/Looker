view: trade_dash_monthly {
  sql_table_name: "LOOKER"."TRADE_DASH_MONTHLY"
    ;;

  measure: client_fund_input {
    type: sum
    sql: ${TABLE}."CLIENT_FUND_INPUT" ;;
  }

  dimension: collateral_type {
    type: string
    sql: ${TABLE}."COLLATERAL_TYPE" ;;
  }

  measure: fill_exchange_fees {
    type: sum
    sql: ${TABLE}."FILL_EXCHANGE_FEES" ;;
  }

  measure: fill_spreads {
    type: sum
    sql: ${TABLE}."FILL_SPREADS" ;;
  }

  measure: fill_talos_fees {
    type: sum
    sql: ${TABLE}."FILL_TALOS_FEES" ;;
  }

  measure: number_coins {
    type: sum
    sql: ${TABLE}."NUMBER_COINS" ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}."ORGANIZATION_ID" ;;
  }

  dimension: processing_status {
    type: string
    sql: ${TABLE}."PROCESSING_STATUS" ;;
  }

  dimension: settlement_status {
    type: string
    sql: ${TABLE}."SETTLEMENT_STATUS" ;;
  }

  dimension: side {
    type: string
    sql: ${TABLE}."SIDE" ;;
  }

  dimension: trade_currency {
    type: string
    sql: ${TABLE}."TRADE_CURRENCY" ;;
  }

  dimension: trade_source {
    type: string
    sql: ${TABLE}."TRADE_SOURCE" ;;
  }

  measure: trade_volume {
    type: sum
    sql: ${TABLE}."TRADE_VOLUME" ;;
  }

  dimension: user_intent {
    type: string
    sql: ${TABLE}."USER_INTENT" ;;
  }

  measure: year_month_creation {
    type: date
    sql: ${TABLE}."YEAR_MONTH_CREATION" ;;
  }

  measure: year_month_post {
    type: date
    sql: ${TABLE}."YEAR_MONTH_POST" ;;
  }

  measure: year_month_trade {
    type: date
    sql: ${TABLE}."YEAR_MONTH_TRADE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
