view: rg_check {
  sql_table_name: "LOOKER"."RG_CHECK"
    ;;

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: level1 {
    type: string
    sql: ${TABLE}."LEVEL1" ;;
  }

  measure: number {
    type: sum
    sql: ${TABLE}."NUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
