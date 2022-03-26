view: players {
  sql_table_name: `uudd_uno.players`
    ;;
  drill_fields: [player_id]

  dimension: player_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Player_ID ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.First_Name ;;
  }

  dimension: name {
    type: string
    sql: CONCAT(${first_name}, ' ', ${last_name});;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}, ' "',${moniker},'" ', ${last_name});;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: moniker {
    type: string
    sql: ${TABLE}.Moniker ;;
  }

  dimension: nationality {
    type: string
    sql: ${TABLE}.Nationality ;;
  }

  dimension: squad_number {
    type: string
    sql: ${TABLE}.Squad_Number ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.Team ;;
  }

  measure: count {
    type: count
    drill_fields: [player_id, first_name, last_name, gamescore.count]
  }
}
