view: hp_transaction_count {

  sql_table_name: "LOOKER"."HP_TRANSACTION_COUNT";;
  label: "Table"

  dimension: coin {
    type: string
    sql: ${TABLE}."COIN" ;;
  }

  dimension: enterprise_id {
    type: string
    sql: ${TABLE}."ENTERPRISE_ID" ;;
  }

  dimension: ofc_flag {
    type: string
    sql: ${TABLE}."OFC_FLAG" ;;
    label: "Offchain Flag"
  }

  dimension: transaction_count {
    type: number
    sql: ${TABLE}."TRANSACTION_COUNT" ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TRANSACTION_DATE" ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}."TRANSACTION_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: transaction_ct {
    label: "Transaction Count"
    type: sum
    sql: ${transaction_count};;
  }
}
