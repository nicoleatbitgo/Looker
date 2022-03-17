connection: "snowflake_looker"

# include all the views
include: "/views/**/*.view"

datagroup: snowflake_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_looker_default_datagroup

explore: eth_transfer {}
#feawfewa
