view: ng_daily_wallet_balance {
  sql_table_name: "LOOKER"."DAILY_WALLET_BALANCE"
    ;;

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

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: account_id {
    description: "Enterprise id for enterprises/ wallet id for paygo"
    type: string
    sql: case when ${enterprise_id}  is not null then ${enterprise_id} else ${wallet_id} end;;
  }

  dimension: eod_balance {
    description: "End of day coin balance"
    type: number
    sql: ${TABLE}."EOD_BALANCE" ;;
  }

  dimension: eod_norm_usd_balance {
    description: "End of day normalized usd balance"
    type: number
    sql: ${TABLE}."EOD_NORM_USD_BALANCE" ;;
  }

  dimension: eod_usd_balance {
    description: "End of day usd balance"
    type: number
    sql: ${TABLE}."EOD_USD_BALANCE" ;;
  }

  dimension: wallet_id {
    type: string
    sql: ${TABLE}."WALLET_ID" ;;
  }

  dimension: wallet_type {
    type: string
    sql: ${TABLE}."WALLET_TYPE" ;;
  }

  dimension: account_type {
    type: string
    sql: Case when ${enterprise_id} is not null then 'Enterprise' else 'Paygo' end;;
  }

  dimension: coin_balance_bin {
    type: bin
    bins: [0, 50 ,100, 500,1000, 2000, 3000, 4000, 5000, 10000]
    style: interval
    sql: ${eod_balance} ;;
    value_format: "0"
  }


  dimension: bitgo_org_updated{
    type: string
    sql: case when ${TABLE}.enterprise_id is not null then ${hp_enterprise_cleanup.bitgo_org}
      else 'Paygo' end ;;
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
    description: "Balance date based on selected date granularity"
    type: string
    label_from_parameter: date_granularity
    sql:
        CASE
          WHEN {% parameter date_granularity %} = 'Day' THEN ${balance_date}
          WHEN {% parameter date_granularity %} = 'Week' and ${is_last_day_of_week} = 'yes' THEN ${balance_date}
          WHEN {% parameter date_granularity %} = 'Month' and ${is_last_day_of_month} = 'yes' THEN ${balance_date}
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

  parameter: metrics {
    type: unquoted
    allowed_value: { label: "Coin volume" value: "volume" }
    allowed_value: { label: "Coin USD value" value: "value" }
  }

  measure: metrics_value {
    type: number
    description: "Value based on selected metric"
    label_from_parameter: metrics
    sql:
       {% if metrics._parameter_value == 'volume' %}
        ${eod_balance_amt}
       {% elsif metrics._parameter_value == 'value' %}
         ${eod_usd_balance_amt}
       {% endif %};;

    html:  {% if metrics._parameter_value == 'volume' %}
          {{rendered_value}}
          {% elsif metrics._parameter_value == 'value' %}
          ${{rendered_value}}
          {% endif %};;

    value_format: "#,##0"
  }


  measure: count {
    type: count
    drill_fields: []
  }

  measure: eod_balance_amt {
    type: sum
    sql: ${eod_balance} ;;
    value_format: "#,##0"
  }

  measure: eod_usd_balance_amt {
    type: sum
    sql: ${eod_usd_balance} ;;
    value_format: "$#,##0"
  }

  measure: account_cnt {
    type: count_distinct
    sql: ${account_id};;
    value_format: "#,##0"
  }

  measure: pos_bal_wallet {
    type: sum
    sql: case when ${eod_balance} > 0 then 1 else 0 end;;
  }

  measure: coin_balance_min {
    type: min
    sql: ${eod_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_per25 {
    type: percentile
    percentile: 25
    sql: ${eod_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_median {
    type: median
    sql: ${eod_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_per75 {
    type: percentile
    percentile: 75
    sql: ${eod_balance} ;;
    value_format: "#,##0"
  }

  measure: coin_balance_max {
    type: max
    sql: ${eod_balance} ;;
    value_format: "#,##0"
  }
}
