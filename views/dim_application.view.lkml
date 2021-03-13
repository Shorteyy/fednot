view: application {
  sql_table_name: `fednot-sandbox-bi.Prestations.dim_application`
    ;;

  dimension: description_fr {
    type: string
    sql: ${TABLE}.descriptionFR ;;
  }

  dimension: description_nl {
    type: string
    sql: ${TABLE}.descriptionNL ;;
  }

  dimension: h_application_bk {
    type: string
    sql: ${TABLE}.h_application_bk ;;
  }

  dimension: h_operation_bk {
    type: string
    sql: ${TABLE}.h_operation_bk ;;
  }

  dimension: h_operation_sk {
    type: string
    sql: ${TABLE}.h_operation_sk ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
