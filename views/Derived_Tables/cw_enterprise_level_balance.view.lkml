# This derived table is a copy of cw_acct_level_bal; using new daily wallet balance table
view: cw_enterprise_level_balance {


    derived_table: {

      explore_source: daily_wallet_balance {
        column: date {}
        column: account_id {}
        column: coin {}
        column: account_type {}
        column: eod_balance_amt {}


        filters: {
          field: daily_wallet_balance.date
          value: "-NULL"
        }

        bind_filters: {
          to_field: daily_wallet_balance.balance_date
          from_field: cw_enterprise_level_balance.balance_date
        }

        bind_filters: {
          to_field: daily_wallet_balance.date_granularity
          from_field: cw_enterprise_level_balance.date_granularity
        }

      }
    }


    parameter: date_granularity {
      type: string
      allowed_value: { value: "Day" }
      allowed_value: { value: "Week" }
      allowed_value: { value: "Month" }
    }

    filter: balance_date {
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

    dimension: eod_balance_amt {
      value_format: "#,##0"
      type: number
      sql: ${TABLE}.eod_balance_amt;;
    }

    dimension: coin_balance_bin {
      type: bin
      bins: [0, 50 ,100, 500,1000, 2000, 3000, 4000, 5000, 10000]
      style: interval
      sql: ${TABLE}.eod_balance_amt;;
      value_format: "0"
    }

    measure: count {
      type: count
    }

    measure: pos_bal_acct {
      type: count_distinct
      sql: CASE
            WHEN ${eod_balance_amt} > 0 THEN ${account_id}
            ELSE NULL
        END ;;
    }
  }
