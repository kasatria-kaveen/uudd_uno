view: nationalities {
  sql_table_name: `uudd_uno.nationalities`
    ;;
  drill_fields: [nationality_id]

  dimension: nationality_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Nationality_ID ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: img_url {
    type: string
    sql: ${TABLE}.ImgUrl ;;
  }

  dimension: flag {
    type: string
    sql: ${TABLE}.ImgUrl;;
    html: <img style="width: 48px;height: 27px;" src="{{value}}" /> ;;
  }
}
