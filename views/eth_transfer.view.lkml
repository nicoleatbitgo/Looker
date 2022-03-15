view: eth_transfer {
  sql_table_name: "LOOKER"."ETH_TRANSFER"
    ;;

  dimension: address_from {
    type: string
    sql: ${TABLE}."ADDRESS_FROM" ;;
  }

  dimension: address_to {
    type: string
    sql: ${TABLE}."ADDRESS_TO" ;;
  }

  dimension: block_number {
    type: string
    sql: ${TABLE}."BLOCK_NUMBER" ;;
  }

  dimension: block_timestamp_convert {
    type: string
    sql: to_date(${TABLE}."BLOCK_TIMESTAMP") ;;
  }

  dimension_group: block_timestamp {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    #datatype: timestamp
    sql: ${block_timestamp_convert} ;;
  }

  dimension: contract_address {
    type: string
    sql: ${TABLE}."CONTRACT_ADDRESS" ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
  }

  dimension: topic_0 {
    type: string
    sql: ${TABLE}."TOPIC_0" ;;
  }

  dimension: txid {
    type: string
    sql: ${TABLE}."TXID" ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}."VALUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [event_name]
  }
}
