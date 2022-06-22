view: hp_auto_debit {

  sql_table_name: "LOOKER"."HP_AUTO_DEBIT";;

  dimension: transaction_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."TRANSACTION_ID" ;;
  }

  dimension: custodial_debit {
    type: number
    sql: ${TABLE}."CUSTODIAL_DEBIT" ;;
  }

  dimension: custodial_debit_coins {
    type: number
    sql: ${TABLE}."CUSTODIAL_DEBIT_COINS" ;;
  }

  dimension: outside_bitgo_transfer {
    type: number
    sql: ${TABLE}."OUTSIDE_BITGO_TRANSFER" ;;
  }

  dimension: outside_bitgo_transfer_of_coins {
    type: number
    sql: ${TABLE}."OUTSIDE_BITGO_TRANSFER_OF_COINS" ;;
  }

  dimension: within_bitgo_transfer {
    type: number
    sql: ${TABLE}."WITHIN_BITGO_TRANSFER" ;;
  }

  dimension: within_bitgo_transfer_of_coins {
    type: number
    sql: ${TABLE}."WITHIN_BITGO_TRANSFER_OF_COINS" ;;
  }

  measure: count {
    type: count
  }

# Created additionally

  measure: custodial_debit_sum {
    type: sum
    label: "Custodial Debit"
    sql: ${custodial_debit} ;;
  }

  measure: outside_bitgo_transfer_sum {
    type: sum
    label: "outside BitGo Transfer"
    sql: ${outside_bitgo_transfer} ;;
  }

  measure: within_bitgo_transfer_sum {
    type: sum
    label: "within BitGo Transfer"
    sql: ${within_bitgo_transfer} ;;
  }

  measure: custodial_debit_coins_sum {
    type: sum
    label: "Custodial Debit (#Coins)"
    sql: ${custodial_debit_coins} ;;
  }

  measure: within_bitgo_transfer_of_coins_sum{
    type: sum
    label: "within BitGo Transfer (#Coins)"
    sql: ${within_bitgo_transfer_of_coins} ;;
  }

  measure: outside_bitgo_transfer_of_coins_sum{
    type: sum
    label: "outside BitGo Transfer (#Coins)"
    sql: ${outside_bitgo_transfer_of_coins} ;;
  }

}
