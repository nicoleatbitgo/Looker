view: rg_wp_metrics {
  derived_table: {
    sql: select * from RG_WP_METRICS
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: metric {
    type: string
    sql: ${TABLE}."METRIC" ;;
  }

  measure: metric_value {
    type: number
    sql: ${TABLE}."METRIC_VALUE" ;;
  }

  dimension: current_week {
    type: date
    sql: ${TABLE}."CURRENT_WEEK" ;;
  }

  set: detail {
    fields: [metric, metric_value, current_week]
  }
}
