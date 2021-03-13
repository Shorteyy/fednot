connection: "fednot_poc"

# include all the views
include: "/views/**/*.view"

datagroup: fednot_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fednot_poc_default_datagroup

# explore: dim_study {}

# explore: dim_application {}

# explore: dim_province {}


explore: prestation {
  join: study {
    sql_on: ${prestation.h_study_sk} = ${study.h_study_sk} ;;
    relationship: many_to_one
    type: left_outer # Could be excluded since left_outer is the default
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
  }




# explore: h_application {}

# explore: h_operation {}

# explore: h_province {}

# explore: h_study {}

# explore: l_application_operation {}

# explore: l_application_operation_province_study {}

# explore: notaries_geo {}

# explore: prestations_dump_2019_2020_studylevel {}

# explore: prestations_geo {}

# explore: province {}

# explore: s_application_operation_province_study {}

# explore: s_operation {}

# explore: s_province {}

# explore: s_study {}

# explore: vw_notaries_geo {}

# explore: vw_s_study {}
