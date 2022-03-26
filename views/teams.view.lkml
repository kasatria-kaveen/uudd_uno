view: teams {
  sql_table_name: `uudd_uno.teams`
    ;;
  drill_fields: [team_id]

  dimension: team_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Team_ID ;;
  }

  dimension: long_name {
    type: string
    sql: ${TABLE}.Long_Name ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.Short_Name ;;
  }

  dimension: team_principal {
    type: string
    sql: ${TABLE}.Team_Principal ;;
  }

}
