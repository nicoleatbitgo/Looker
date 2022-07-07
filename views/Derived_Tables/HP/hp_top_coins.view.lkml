view: hp_test {
    view_label: "Top 10s"
    derived_table: {
      explore_source: hp_heat_map_wallet_balance {

        column: coin {
          field: hp_heat_map_wallet_balance.coin
        }

        column: coin_balance {
          field: hp_heat_map_wallet_balance.coin_balance_sum
        }

        derived_column: rank {
          sql: RANK() OVER (ORDER BY coin_balance DESC) ;;
        }

        # bind_all_filters: yes
        # sorts: [order_items.total_sale_price: desc]
        # timezone: "query_timezone"
        # limit: 10

      }
    }

    dimension: coin {
      group_label: "Simple Example"
    }

    dimension: rank {
      type: number
      group_label: "Simple Example"
    }

  dimension: coin_balance {
    type: number
    group_label: "Simple Example"
  }

    dimension: coin_ranked {
      group_label: "Simple Example"
      order_by_field: rank
      type: string
      sql: ${rank} || '_' || ${coin} ;;
    }

  # measure: actual_wallet_balance {
  #   type: number
  #   group_label: "Simple Example"
  # }
}
