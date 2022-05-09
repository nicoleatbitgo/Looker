connection: "snowflake_looker"

# include all the views
include: "/views/**/eth_transfer.view"
include: "/views/**/rg_wp_metrics.view"

datagroup: snowflake_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_looker_default_datagroup

explore: rg_wp_metrics {}
explore: eth_transfer {}
#feawfewa
