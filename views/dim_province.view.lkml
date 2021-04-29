view: province {
  sql_table_name: `fednot-sandbox-bi.Prestations.dim_province`
    ;;

  dimension: country {
    type: string
    map_layer_name: countries
    drill_fields: [region, province]
    sql: ${TABLE}.country ;;
  }

  dimension: country_location {
    type: location
    sql_latitude: ${TABLE}.country_lat ;;
    sql_longitude: ${TABLE}.country_lon ;;
  }

  dimension: province {
    hidden: yes
    type: string
    sql: ${TABLE}.h_province_bk ;;
  }

  dimension: h_province_sk {
    type: string
    primary_key: yes
    sql: ${TABLE}.h_province_sk ;;
    hidden: yes
  }

  dimension: province_location {
    type: location
    sql_latitude: ${TABLE}.province_lat ;;
    sql_longitude: ${TABLE}.province_lon ;;
  }

  #dimension: province_location_area {
  #  type: string
  #  map_layer_name: province_location
  #  sql: ${TABLE}.h_province_bk ;;
  #}

dimension: province_location_area {
  label: "Province Area"
    type: string
    map_layer_name: province_location_belgium
    sql: concat("Provincie " || trim(${TABLE}.h_province_bk)) ;;
  }

dimension: region_location_area {
    type: string
    label: "Region Area"
    drill_fields: [province_location_area]
    map_layer_name: region_location_belgium
    sql: CASE
    WHEN ${TABLE}.region = "Vlaanderen" THEN "Vlaams Gewest"
    WHEN ${TABLE}.region = "Wallonie" THEN "Waals Gewest"
    ELSE "Brussels Hoofdstedelijk Gewest"
    END ;;
  }

  dimension: region {
    hidden: yes
    type: string
    drill_fields: [province]
    sql: ${TABLE}.region ;;
  }

  dimension: region_location {
    type: location
    sql_latitude: ${TABLE}.region_lat ;;
    sql_longitude: ${TABLE}.region_lon ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
