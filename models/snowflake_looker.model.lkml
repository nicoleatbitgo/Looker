connection: "snowflake_looker"

# include all the views
include: "/views/**/eth_transfer.view"
include: "/views/**/rg_wp_metrics.view"
include: "/views/cw_coin_dash_new.view.lkml"

datagroup: snowflake_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_looker_default_datagroup

explore: rg_wp_metrics {}
explore: eth_transfer {}
#feawfewa


explore: cw_coin_dash_new {
  label: "Coin Dash"
}
