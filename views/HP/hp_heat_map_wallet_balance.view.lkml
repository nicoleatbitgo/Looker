view: hp_heat_map_wallet_balance {
  required_access_grants: [can_view]
  sql_table_name: "LOOKER"."HP_HEAT_MAP_WALLET_BALANCE"
    ;;

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: account_tier {
    type: string
    sql: ${TABLE}."ACCOUNT_TIER" ;;
  }

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

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: csm {
    type: string
    label: "CSM"
    sql: ${TABLE}."CSM" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: enterprise_name {
    type: string
    sql: ${TABLE}."ENTERPRISE_NAME" ;;
  }

  dimension: flag {
    type: string
    sql: ${TABLE}."FLAG" ;;
  }

  dimension: kyc_state {
    type: string
    sql: ${TABLE}."KYC_STATE" ;;
  }

  dimension: licenses {
    type: string
    sql: ${TABLE}."LICENSES" ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${TABLE}."PRICING_PLAN" ;;
  }

  dimension: upfront_payment_status {
    type: string
    sql: ${TABLE}."UPFRONT_PAYMENT_STATUS" ;;
  }

  dimension: wallet_balance {
    type: number
    sql: ${TABLE}."WALLET_BALANCE" ;;
  }

  dimension: coin_balance {
    type: number
    sql: ${TABLE}."COIN_BALANCE" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: is_last_day_of_month {
    hidden: yes
    type: yesno
    sql: dayofmonth(DATEADD(day,1,${balance_date}) ) = 1 ;;
  }

  dimension: is_last_day_of_week {
    hidden: yes
    type: yesno
    sql: dayofweek(DATEADD(day,1,${balance_date})) = 1 ;;
  }

  parameter: date_granularity {
    type: string
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }

  dimension: date {
    type: string
    description: "Balance date based on selected date granularity"
    label_from_parameter: date_granularity
    sql:
    CASE
          WHEN {% parameter date_granularity %} = 'Day' THEN ${balance_date}
          WHEN {% parameter date_granularity %} = 'Week' and ${is_last_day_of_week} = 'yes' THEN ${balance_date}
          WHEN {% parameter date_granularity %} = 'Month' and ${is_last_day_of_month} = 'yes' THEN ${balance_date}
        END ;;
  }

  measure: count {
    type: count
  }

  measure: wallet_balance_sum {
    type: sum
    label: "Wallet Balance"
    sql: ${wallet_balance} ;;
    value_format: "$#,###.00"
  }

  measure: coin_balance_sum {
    type: sum
    label: "Coin Balance"
    sql: ${coin_balance} ;;
    value_format: "#,###.00"
  }


}
