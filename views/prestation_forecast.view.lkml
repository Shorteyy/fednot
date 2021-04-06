view: prestation_forecast {
  derived_table: {
    sql: select '20190101' as month_start_date, 'Vlaanderen' as region, '303000' as forecasted_value
      union all select '20190201', 'Vlaanderen', '306030'
      union all select '20190301', 'Vlaanderen', '309090'
      union all select '20190401', 'Vlaanderen', '312180'
      union all select '20190501', 'Vlaanderen', '315301'
      union all select '20190601', 'Vlaanderen', '318454'
      union all select '20190701', 'Vlaanderen', '321638'
      union all select '20190801', 'Vlaanderen', '324854'
      union all select '20190901', 'Vlaanderen', '328102'
      union all select '20191001', 'Vlaanderen', '331383'
      union all select '20191101', 'Vlaanderen', '334696'
      union all select '20191201', 'Vlaanderen', '338042'
      union all select '20200101', 'Vlaanderen', '348183'
      union all select '20200201', 'Vlaanderen', '358628'
      union all select '20200301', 'Vlaanderen', '369386'
      union all select '20200401', 'Vlaanderen', '380467'
      union all select '20200501', 'Vlaanderen', '391881'
      union all select '20200601', 'Vlaanderen', '403637'
      union all select '20200701', 'Vlaanderen', '415746'
      union all select '20200801', 'Vlaanderen', '428218'
      union all select '20200901', 'Vlaanderen', '441064'
      union all select '20201010', 'Vlaanderen', '454295'
      union all select '20201101', 'Vlaanderen', '467923'
      union all select '20201201', 'Vlaanderen', '481960'
      union all select '20210101', 'Vlaanderen', '496418'
      union all select '20210201', 'Vlaanderen', '511310'
      union all select '20190101', 'Wallonie', '151500'
      union all select '20190201', 'Wallonie', '153015'
      union all select '20190301', 'Wallonie', '154545'
      union all select '20190401', 'Wallonie', '156090'
      union all select '20190501', 'Wallonie', '157650'
      union all select '20190601', 'Wallonie', '159226'
      union all select '20190701', 'Wallonie', '160818'
      union all select '20190801', 'Wallonie', '162426'
      union all select '20190901', 'Wallonie', '164050'
      union all select '20191001', 'Wallonie', '165690'
      union all select '20191101', 'Wallonie', '167346'
      union all select '20191201', 'Wallonie', '169019'
      union all select '20200101', 'Wallonie', '175779'
      union all select '20200201', 'Wallonie', '182810'
      union all select '20200301', 'Wallonie', '190122'
      union all select '20200401', 'Wallonie', '197726'
      union all select '20200501', 'Wallonie', '205635'
      union all select '20200601', 'Wallonie', '213860'
      union all select '20200701', 'Wallonie', '222414'
      union all select '20200801', 'Wallonie', '231310'
      union all select '20200901', 'Wallonie', '240562'
      union all select '20201010', 'Wallonie', '250184'
      union all select '20201101', 'Wallonie', '260191'
      union all select '20201201', 'Wallonie', '270598'
      union all select '20210101', 'Wallonie', '281421'
      union all select '20210201', 'Wallonie', '292677'
      union all select '20190101', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '505000'
      union all select '20190201', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '510050'
      union all select '20190301', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '515150'
      union all select '20190401', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '520301'
      union all select '20190501', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '525504'
      union all select '20190601', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '530759'
      union all select '20190701', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '536066'
      union all select '20190801', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '541426'
      union all select '20190901', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '546840'
      union all select '20191001', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '552308'
      union all select '20191101', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '557831'
      union all select '20191201', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '563409'
      union all select '20200101', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '580311'
      union all select '20200201', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '597720'
      union all select '20200301', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '615651'
      union all select '20200401', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '634120'
      union all select '20200501', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '653143'
      union all select '20200601', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '672737'
      union all select '20200701', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '692919'
      union all select '20200801', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '713706'
      union all select '20200901', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '735117'
      union all select '20201010', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '757170'
      union all select '20201101', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '779885'
      union all select '20201201', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '803281'
      union all select '20210101', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '827379'
      union all select '20210201', 'Brussels Hoofdstedelijk Gewest / Région de Bruxelles', '852200'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month_start_date {
    type: date
    sql: cast(concat(substr(${TABLE}.month_start_date,1,4),"-", substr(${TABLE}.month_start_date,5,2),"-", substr(${TABLE}.month_start_date,7,2)) as date);;
    allow_fill: no
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(cast(${TABLE}.month_start_date as string ), ' ', ${TABLE}.region) ;;
  }

  dimension: forecasted_value {
    type: number
    sql: cast(${TABLE}.forecasted_value as numeric);;
  }

  measure: sum_forecased_value {
    hidden: no
    type: sum
    sql: ${forecasted_value} ;;
  }

  set: detail {
    fields: [month_start_date, region, forecasted_value]
  }
}
