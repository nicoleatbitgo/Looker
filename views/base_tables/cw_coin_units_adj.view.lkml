view: cw_coin_units_adj {
  sql_table_name: "LOOKER"."CW_COIN_UNITS_ADJ"
    ;;

  dimension: coin {
    primary_key: yes
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: coin_group {
    type: string
    sql: ${TABLE}."COIN_GROUP" ;;
  }

  dimension: unit1 {
    type: string
    sql: ${TABLE}."UNIT1" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: test {}
}
