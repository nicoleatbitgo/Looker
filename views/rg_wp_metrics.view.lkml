view: rg_wp_metrics {

    sql_table_name: "LOOKER"."RG_WP_METRICS";;

    dimension_group: current_week {
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
      sql: ${TABLE}."CURRENT_WEEK" ;;
    }

    dimension: metric {
      type: string
      sql: ${TABLE}."METRIC" ;;
    }

    dimension: definition {
      type: string
      sql: ${TABLE}."DEFINITION" ;;
    }

    dimension: LOB {
      type: string
      sql: ${TABLE}."LOB" ;;
    }

    measure: metric_value {
      type: sum
      sql: ${TABLE}."METRIC_VALUE" ;;
    }

    measure: Last_n_weeks {
      type: sum
      sql: ${TABLE}."LAST_N_WEEKS" ;;
    }

    measure: count {
      type: count
      drill_fields: []
    }
  }
