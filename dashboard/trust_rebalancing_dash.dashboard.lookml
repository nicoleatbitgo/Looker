- dashboard: trust_rebalancing_dash
  title: Trust Re-balancing Dash
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DjLqofyTZmbQrFtMn8Ld2W
  elements:
  - title: Custodial and trading wallet balances
    name: Custodial and trading wallet balances
    model: snowflake_looker
    explore: ng_daily_wallet_balance
    type: looker_grid
    fields: [ng_daily_wallet_balance.balance_date, ng_daily_wallet_balance.account_id,
      hp_enterprise_cleanup.enterprise_name, ng_daily_wallet_balance.bitgo_org_updated,
      ng_daily_wallet_balance.wallet_id, ng_daily_wallet_balance.wallet_type, hp_wallet_cleanup.coin,
      ng_daily_wallet_balance.eod_balance_amt, ng_daily_wallet_balance.eod_usd_balance_amt]
    filters:
      ng_daily_wallet_balance.bitgo_org_updated: ''
      ng_daily_wallet_balance.balance_date: this month
      ng_daily_wallet_balance.wallet_type: custodial,trading
      ng_daily_wallet_balance.eod_usd_balance_amt: ">100000000"
    sorts: [ng_daily_wallet_balance.balance_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: latest_date, label: Latest date, expression: 'index(${ng_daily_wallet_balance.balance_date},1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: date}, {table_calculation: is_latest, label: 'Is latest ?', expression: "${latest_date}\
          \ = ${ng_daily_wallet_balance.balance_date}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: yesno}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      ng_daily_wallet_balance.eod_balance_amt: Coins
      ng_daily_wallet_balance.eod_usd_balance_amt: US$
      ng_daily_wallet_balance.account_id: Enterprise ID
      ng_daily_wallet_balance.bitgo_org_updated: Bitgo Org
      hp_wallet_cleanup.coin: Wallet Coin
    series_column_widths: {}
    series_cell_visualizations:
      ng_daily_wallet_balance.eod_balance_amt:
        is_active: false
    series_text_format:
      ng_daily_wallet_balance.eod_usd_balance_amt:
        align: right
    hidden_points_if_no: [is_latest]
    defaults_version: 1
    hidden_fields: [latest_date]
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 8
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "- This dashboard shows all custodial and trading wallets with balance\
      \ > 100 mn"
    row: 8
    col: 0
    width: 24
    height: 2
