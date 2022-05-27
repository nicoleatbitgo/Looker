view: cw_acct_level_bal {

  derived_table: {

      explore_source: cw_v2_coin_dash_bal {
        column: date {}
        column: account_id {}
        column: coin {}
        column: account_type {}
        column: coin_balance_amt {}


        filters: {
          field: cw_v2_coin_dash_bal.date
          value: "-NULL"
        }

        bind_filters: {
          to_field: cw_v2_coin_dash_bal.transaction_date
          from_field: cw_acct_level_bal.transaction_date
        }

        bind_filters: {
          to_field: cw_v2_coin_dash_bal.date_granularity
          from_field: cw_acct_level_bal.date_granularity
        }

      }
    }


  parameter: date_granularity {
    type: string
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }

  filter: transaction_date {
    type: date
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: account_id {
    description: "Enterprise id for enterprises/ wallet id for paygo"
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: coin {
    type: string
    sql: ${TABLE}.coin ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: coin_balance_amt {
    value_format: "#,##0"
    type: number
    sql: ${TABLE}.coin_balance_amt;;
  }

  dimension: coin_balance_bin {
    type: bin
    bins: [0, 50 ,100, 500,1000, 2000, 3000, 4000, 5000, 10000]
    style: interval
    sql: ${TABLE}.coin_balance_amt;;
    value_format: "0"
  }

  measure: count {
    type: count
  }

}
