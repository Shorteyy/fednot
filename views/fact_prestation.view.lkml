view: prestation {
  sql_table_name: `fednot-sandbox-bi.Prestations.fact_prestation`
    ;;

  parameter: timeframe_picker {
    label: "Period Selector"
    type: unquoted
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
  }

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


  dimension: year_month {
    type: string
    # sql: ${TABLE}.yearMonth ;;
    hidden:  yes
    sql: ${TABLE}.yearMonth ;;
  }

  dimension: month_start_date {
    type: date
    datatype: date
    hidden:  yes
    # sql: ${TABLE}.yearMonth ;;
    sql: cast(${year_month} as date) ;;
    allow_fill: no
  }


  dimension_group: Dategroup {
    type: time
    timeframes: [date, month_name, quarter, year, quarter_of_year]
    datatype: date
    # sql: ${TABLE}.yearMonth ;;
    sql: ${month_start_date} ;;
    allow_fill: no
  }

  dimension: timeframe {
    label_from_parameter: timeframe_picker
    type: string
    sql:
    {% if timeframe_picker._parameter_value == 'Month'  %}
      ${Dategroup_month_name}
    {% elsif timeframe_picker._parameter_value == 'Year' %}
      ${Dategroup_year}
      {% elsif timeframe_picker._parameter_value == 'Quarter' %}
      ${Dategroup_quarter_of_year}
    {% else %}
      ${Dategroup_quarter}
    {% endif %};;
    # timeframes: [date, month_name, year]
    # datatype: date
    # sql: ${TABLE}.yearMonth ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_qty {
    type: sum
    sql: ${qty} ;;
  }

  measure: avg_qty {
    type:  average
    sql: ${qty} ;;
  }

}
