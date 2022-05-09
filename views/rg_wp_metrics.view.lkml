view: rg_wp_metrics {
  sql_table_name: "LOOKER"."RG_WP_METRICS"
    ;;

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

  measure: metric_value {
    type: sum
    sql: ${TABLE}."METRIC_VALUE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
