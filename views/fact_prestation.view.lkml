view: fact_prestation {
  sql_table_name: `fednot-sandbox-bi.Prestations.fact_prestation`
    ;;

  dimension: h_operation_sk {
    type: string
    sql: ${TABLE}.h_operation_sk ;;
  }

  dimension: h_province_sk {
    type: string
    sql: ${TABLE}.h_province_sk ;;
  }

  dimension: h_study_sk {
    type: string
    sql: ${TABLE}.h_study_sk ;;
  }

  dimension: l_application_operation_province_study_sk {
    type: string
    sql: ${TABLE}.l_application_operation_province_study_sk ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: year_month {
    type: string
    sql: ${TABLE}.yearMonth ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: sum_qty {
    type: sum
    sql: ${qty} ;;
  }
}
