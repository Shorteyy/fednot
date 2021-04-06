connection: "fednot_poc"

# include all the views
include: "/views/**/*.view"

datagroup: fednot_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fednot_poc_default_datagroup

map_layer: province_location {
  file: "/maps/arvastat_be_maps_top_Province.topojson"
  property_key: "nameNL"
}

# explore: dim_study {}

# explore: dim_application {}

# explore: dim_province {}

explore: prestation {
  label: "Self Service"
#  access_filter: {
#   field: province.region
#   user_attribute: region
#  }
  join: study {
    sql_on: ${prestation.h_study_sk} = ${study.h_study_sk} ;;
    relationship: many_to_one
    type: left_outer # Could be excluded since left_outer is the default
    fields: [] #dit zou de hele study view moeten hiden
    }
  join: application {
    sql_on: ${prestation.h_operation_sk} = ${application.h_operation_sk} ;;
    relationship: many_to_one
    type: left_outer # Could be excluded since left_outer is the default
    }
  join: province {
    sql_on: ${prestation.h_province_sk} = ${province.h_province_sk} ;;
    relationship: many_to_one
    type: left_outer # Could be excluded since left_outer is the default
    }
  join: prestation_forecast {
    sql_on: ${prestation_forecast.month_start_date} =${prestation.month_start_date} AND ${prestation_forecast.region}=${province.region} ;;
    relationship: many_to_one
    type:  left_outer
  }
  }
