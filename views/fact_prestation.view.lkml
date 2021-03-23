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
    hidden:  yes
    sql: ${TABLE}.yearMonth ;;
  }

  dimension: month_start_date {
    type: date
    datatype: date
    hidden:  yes
    sql: cast(${year_month} as date) ;;
    allow_fill: no
  }

  dimension_group: Dategroup {
    type: time
    timeframes: [date, month, month_name, quarter, year, quarter_of_year]
    datatype: date
    sql: ${month_start_date} ;;
    allow_fill: no
  }

  dimension: is_ytd {
    type: yesno
    group_label: "Date Restrictions"
    label: "Is YTD?"
    view_label: "Dynamic Grouping & Time Comparisons"
    sql: EXTRACT(MONTH from ${month_start_date}) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: timeframe {
    label_from_parameter: timeframe_picker
    type: string
    view_label: "Dynamic Grouping & Time Comparisons"
    sql:
    {% if timeframe_picker._parameter_value == 'Month'  %}
      ${Dategroup_month}
    {% elsif timeframe_picker._parameter_value == 'Year' %}
      ${Dategroup_year}
      {% elsif timeframe_picker._parameter_value == 'Quarter' %}
      concat(${Dategroup_year},"-",${Dategroup_quarter_of_year})
    {% else %}
      concat($(${Dategroup_year},"-",${Dategroup_quarter_of_year})
    {% endif %};;
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

  measure: percent_of_total_operations {
    type: percent_of_total
    value_format: "0.00\%"
    sql: ${sum_qty} ;;
  }

  measure: total_sum_ytd {
   type: sum
    filters: {
      field: is_ytd
      value: "yes"
    }
   sql: ${qty} ;;
  }

}
