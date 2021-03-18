view: prestation {
  sql_table_name: `fednot-sandbox-bi.Prestations.fact_prestation`
    ;;

  dimension: h_operation_sk {
    type: string
    sql: ${TABLE}.h_operation_sk ;;
    hidden: yes
  }

  dimension: h_province_sk {
    type: string
    sql: ${TABLE}.h_province_sk ;;
    hidden: yes
  }

  dimension: h_study_sk {
    type: string
    sql: ${TABLE}.h_study_sk ;;
    hidden: yes
  }

  dimension: l_application_operation_province_study_sk {
    type: string
    sql: ${TABLE}.l_application_operation_province_study_sk ;;
    hidden: yes
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
    hidden: yes
  }

  # dimension: year_month {
  #   type: string
  #   # sql: ${TABLE}.yearMonth ;;
  #   hidden:  yes
  #   sql: CONCAT(${TABLE}.yearMonth, '01') ;;
  # }

  # dimension: date {
  #   type: date
  #   hidden:  yes
  #   # sql: ${TABLE}.yearMonth ;;
  #   sql: PARSE_DATE ("%Y%m%d",${year_month}) ;;
  # }

  # dimension_group: Dategroup {
  #   type: time
  #   timeframes: [date, month_name, year]
  #   # sql: ${TABLE}.yearMonth ;;
  #   sql: PARSE_DATE ("%Y%m%d",CONCAT(${TABLE}.yearMonth, '01')) ;;
  # }

  dimension_group: Dategroup {
    type: time
    timeframes: [date, month_name, year]
    datatype: date
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
