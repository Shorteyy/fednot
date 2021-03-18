view: application {
  sql_table_name: `fednot-sandbox-bi.Prestations.dim_application`
    ;;


  parameter: pick_language {
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: description_fr {
    type: string
    hidden: yes
    sql: ${TABLE}.descriptionFR ;;
  }

  dimension: description_nl {
    type: string
    hidden: yes
    sql: ${TABLE}.descriptionNL ;;
  }

  dimension: description {
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          ${description_nl}
        {% elsif pick_language._parameter_value == "'FR'" %}
          ${description_fr}
         {% else %}
           ${description_nl}
        {% endif %};;
  }

  dimension: application {
    type: string
    sql: ${TABLE}.h_application_bk ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.h_operation_bk ;;
  }

  dimension: operation_group {
    case: {
      when: {
        sql: Upper(${TABLE}.h_operation_bk) like "%INSCHR%";;
        label: "Inschrijving"
      }
      when: {
        sql: Upper(${TABLE}.h_operation_bk) like "%TELEFONISCH%";;
        label: "Telefonisch"
      }
      when: {
        sql: Upper(${TABLE}.h_operation_bk) like "%OPZOEKING%";;
        label: "Opzoeking"
      }
      when: {
        sql: Upper(${TABLE}.h_operation_bk) like "%CONSULTATIE%";;
        label: "Consultatie"
      }
      when: {
        sql: Upper(${TABLE}.h_operation_bk) like "%VERKLARING%";;
        label: "Verklaring"
      }
      when: {
        sql: Upper(${TABLE}.h_operation_bk) like "%PUBLICATIE%";;
        label: "Publicatie"
      }
      else: "Niet van toepassing"
    }
  }

  dimension: h_operation_sk {
    type: string
    sql: ${TABLE}.h_operation_sk ;;
    hidden: yes
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
