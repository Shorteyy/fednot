view: dim_province {
  sql_table_name: `fednot-sandbox-bi.Prestations.dim_province`
    ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_lat {
    type: number
    sql: ${TABLE}.country_lat ;;
  }

  dimension: country_lon {
    type: number
    sql: ${TABLE}.country_lon ;;
  }

  dimension: h_province_bk {
    type: string
    sql: ${TABLE}.h_province_bk ;;
  }

  dimension: h_province_sk {
    type: string
    sql: ${TABLE}.h_province_sk ;;
  }

  dimension: province_lat {
    type: number
    sql: ${TABLE}.province_lat ;;
  }

  dimension: province_lon {
    type: number
    sql: ${TABLE}.province_lon ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: region_lat {
    type: number
    sql: ${TABLE}.region_lat ;;
  }

  dimension: region_lon {
    type: number
    sql: ${TABLE}.region_lon ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
