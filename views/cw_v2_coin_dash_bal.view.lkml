view: cw_v2_coin_dash_bal {
  sql_table_name: "LOOKER"."CW_V2_COIN_DASH_BAL"
    ;;

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: coin_balance {
    type: number
    sql: ${TABLE}."COIN_BALANCE" ;;
  }

  dimension: account_id {
    alias: [enterprise_wallet_coal]
    description: "Enterprise id for enterprises/ wallet id for paygo"
    type: string
    sql: ${TABLE}."ENTERPRISE_WALLET_COAL" ;;
  }

  dimension: pos_wallet_flag {
    type: number
    sql: ${TABLE}."POS_WALLET_FLAG" ;;
  }

  dimension_group: transaction {
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
    sql: ${TABLE}."TRANSACTION_DATE" ;;
  }

  dimension: account_type {
    alias: [type_flag]
    type: string
    sql: ${TABLE}."TYPE_FLAG" ;;
  }

  dimension: bitgo_org {
    type: string
    sql: ${TABLE}. "BITGO_ORG" ;;
  }

  dimension: coin_group {
    type: string
    sql: ${TABLE}. "COIN_GROUP" ;;
  }

  dimension: usd_balance {
    type: number
    sql: ${TABLE}."USD_BALANCE" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: coin_balance_bin {
    type: bin
    bins: [0, 50 ,100, 500,1000, 2000, 3000, 4000, 5000, 10000]
    style: interval
    sql: ${coin_balance} ;;
    value_format: "0"
  }

  dimension: is_last_day_of_month {
    hidden: yes
    type: yesno
    sql: dayofmonth(DATEADD(day,1,${transaction_date}) ) = 1 ;;
  }

  dimension: is_last_day_of_week {
    hidden: yes
    type: yesno
    sql: dayofweek(DATEADD(day,1,${transaction_date})) = 1 ;;
  }


  parameter: date_granularity {
    type: string
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }

  dimension: date {
    type: string
    label_from_parameter: date_granularity
    sql:
        CASE
          WHEN {% parameter date_granularity %} = 'Day' THEN ${transaction_date}
          WHEN {% parameter date_granularity %} = 'Week' and ${is_last_day_of_week} = 'yes' THEN ${transaction_date}
          WHEN {% parameter date_granularity %} = 'Month' and ${is_last_day_of_month} = 'yes' THEN ${transaction_date}
        END ;;
  }


  parameter: top_n_coins {
    type: string
    allowed_value: { value: "Top 10 coins" }
    allowed_value: { value: "Top 25 coins" }
    allowed_value: { value: "Top 50 coins" }
  }

  dimension: rank_limit {
    type: number
    sql: CASE
           WHEN {% parameter top_n_coins %} = 'Top 10 coins' THEN 10
           WHEN {% parameter top_n_coins %} = 'Top 25 coins' THEN 25
           WHEN {% parameter top_n_coins %} = 'Top 50 coins' THEN 50
         END;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: coin_balance_amt {
    type: sum
    sql: ${coin_balance} ;;
   value_format: "#,##0"
 #  value_format: "[>=1]#,##0;[>0]0.00;#,##0"
  }

  measure: usd_balance_amt {
    type: sum
    sql: ${usd_balance} ;;
    value_format: "$#,##0"
  }


  measure: account_cnt {
    type: count_distinct
    sql: ${account_id};;
    value_format: "#,##0"

  }

  measure: pos_bal_wallet {
    type: sum
    sql: ${pos_wallet_flag};;
  }


  measure: coin_balance_min {
    type: min
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_per25 {
    type: percentile
    percentile: 25
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_median {
    type: median
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_per75 {
    type: percentile
    percentile: 75
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_max {
    type: max
    sql: ${coin_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_cnt {
    type: count_distinct
    sql: ${coin} ;;
  }
}
