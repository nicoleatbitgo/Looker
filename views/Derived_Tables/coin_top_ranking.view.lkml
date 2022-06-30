# This view shows the top 10 coins by metrics for the most recent week
view: coin_top_ranking {


  derived_table: {
    explore_source: ng_daily_wallet_balance {

      column: date {}
      column: coin {}
      column: volume {field:ng_daily_wallet_balance.eod_balance_amt}
      column: value {field:ng_daily_wallet_balance.eod_usd_balance_amt}
      column: normvalue {field: ng_daily_wallet_balance.eod_norm_usd_balance_amt}

      derived_column: ranking {
        sql: rank() over (partition by date order by {% parameter metrics %} desc) ;;
      }

      filters: {
        field: ng_daily_wallet_balance.date_granularity
        value: "Week"
      }

      filters: {
        field: ng_daily_wallet_balance.balance_date
        value: "8 days"
      }

      filters: {
        field: ng_daily_wallet_balance.date
        value: "-NULL"
      }


      bind_all_filters: yes


    }
  }



  parameter: top_n_coins {
    type: string
    allowed_value: { value: "Top 10 coins" }
    allowed_value: { value: "Top 25 coins" }
    allowed_value: { value: "Top 50 coins" }
  }

  parameter: metrics {
    type: unquoted
    default_value: "volume"
    allowed_value: {
      label: "Volume"
      value: "volume"
    }
    allowed_value: {
      label: "USD value"
      value: "value"
    }
    allowed_value: {
      label: "Normalized USD value"
      value: "normvalue"
    }
  }

  dimension: num_coins {
    type: number
    sql: CASE
           WHEN {% parameter top_n_coins %} = 'Top 10 coins' THEN 10
           WHEN {% parameter top_n_coins %} = 'Top 25 coins' THEN 25
           WHEN {% parameter top_n_coins %} = 'Top 50 coins' THEN 50
         END;;
  }

  dimension: date {
    description: "Balance date based on selected date granularity"
    type: string
    sql: ${TABLE}.date  ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}.coin  ;;
  }

  dimension: ranking {
    type: number
    sql: ${TABLE}.ranking ;;
  }

  dimension: top_coin_name {
    type: string
    sql:
      CASE
        WHEN ${ranking}<= ${num_coins} THEN ${coin}
        ELSE 'other'
      END
    ;;
  }

  measure: metrics_value {
    type: number
    description: "Value based on selected metric"
    label_from_parameter: metrics
    sql: {% if metrics._parameter_value == 'volume' %}
        ${ng_daily_wallet_balance.eod_balance_amt}
       {% elsif metrics._parameter_value == 'value' %}
          ${ng_daily_wallet_balance.eod_usd_balance_amt}
       {% elsif metrics._parameter_value == 'normvalue' %}
          ${ng_daily_wallet_balance.eod_norm_usd_balance_amt}
       {% endif %};;

    html:  {% if metrics._parameter_value == 'volume' %}
          {{rendered_value}}
          {% elsif metrics._parameter_value == 'value' %}
          ${{rendered_value}}
          {% elsif metrics._parameter_value == 'normvalue' %}
          ${{rendered_value}}
          {% endif %};;

    value_format: "#,##0"
  }


}
