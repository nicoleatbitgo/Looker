view: rg_check {
  sql_table_name: "LOOKER"."RG_CHECK"
    ;;

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}."NUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
