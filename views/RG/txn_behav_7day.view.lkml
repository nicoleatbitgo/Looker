  view: txn_behav_7day {
    derived_table: {
      sql: select *,sum(outside_bitgo_send) over(order by transfer_date rows between 6 preceding and current row) aS outflow_7d_usd,
              sum(outside_bitgo_receive) over(order by transfer_date rows between 6 preceding and current row) aS inflow_7d_usd,
              sum(inter_enterprise_usd_transfer) over(order by transfer_date rows between 6 preceding and current row) aS inter_bitgo_transfer_7d
              from
              (select transfer_date,
              sum(case when type = 'send' then outside_bitgo_final_usd end) as outside_bitgo_send,
              sum(case when type = 'receive' then outside_bitgo_final_usd end) as outside_bitgo_receive,
              sum(case when type = 'receive' then Inter_enterprise_transfer_final_usd end) as inter_enterprise_usd_transfer
              from rg_transfer_wallet_daily
              group by 1)
              order by transfer_date
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension_group: transfer {
      type: time
      timeframes: [
        raw,
        date,
        week,
        day_of_week,
        month,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}."TRANSFER_DATE" ;;
    }

    measure: outside_bitgo_send {
      type: sum
      sql: ${TABLE}."OUTSIDE_BITGO_SEND" ;;
    }

    measure: outside_bitgo_receive {
      type: sum
      sql: ${TABLE}."OUTSIDE_BITGO_RECEIVE" ;;
    }

    measure: inter_enterprise_usd_transfer {
      type: sum
      sql: ${TABLE}."INTER_ENTERPRISE_USD_TRANSFER" ;;
    }

    measure: outflow_7_d_usd {
      type: sum
      sql: ${TABLE}."OUTFLOW_7D_USD" ;;
    }

    measure: inflow_7_d_usd {
      type: sum
      sql: ${TABLE}."INFLOW_7D_USD" ;;
    }

    measure: inter_bitgo_transfer_7_d {
      type: sum
      sql: ${TABLE}."INTER_BITGO_TRANSFER_7D" ;;
    }

    set: detail {
      fields: [
        transfer_date,
        outside_bitgo_send,
        outside_bitgo_receive,
        inter_enterprise_usd_transfer,
        outflow_7_d_usd,
        inflow_7_d_usd,
        inter_bitgo_transfer_7_d
      ]
    }
  }
