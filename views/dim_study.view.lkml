view: study {
  sql_table_name: `Prestations.dim_study`
    ;;

  dimension: h_study_sk {
    type: string
    hidden: yes
    sql: ${TABLE}.h_study_sk ;;
  }

  dimension: h_study_bk {
    type: number
    sql: ${TABLE}.h_study_bk ;;
  }

  dimension: study_name {
    type: string
    hidden: yes
    sql: ${TABLE}.studyName ;;
  }

  dimension: street {
    type: string
    hidden: yes
    sql: ${TABLE}.street ;;
  }

  dimension: estate_number {
    type: string
    hidden: yes

    sql: ${TABLE}.estateNumber ;;
  }

  dimension: postal_code {
    type: number
    hidden:  yes
    sql: ${TABLE}.postalCode ;;
  }

  dimension: lat {
    type: number
    hidden: yes
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    hidden:  yes
    sql: ${TABLE}.lon ;;
  }

  measure: count {
    type: count
    drill_fields: [study_name]
  }
}
