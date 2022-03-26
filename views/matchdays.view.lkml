view: matchdays {
  sql_table_name: `uudd_uno.matchdays`
    ;;
  drill_fields: [matchday_id]

  dimension: matchday_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Matchday_ID ;;
  }

  dimension: arena_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.Arena_ID ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.Date ;;
  }

  dimension: episode_id {
    type: string
    sql: ${TABLE}.Episode_ID ;;
  }

  dimension: episode_number {
    type: string
    sql: ${TABLE}.Episode_Number ;;
  }

  dimension: first_match {
    type: string
    sql: ${TABLE}.First_Match ;;
  }

  dimension: last_match {
    type: string
    sql: ${TABLE}.Last_Match ;;
  }

  dimension: season {
    type: string
    sql: ${TABLE}.Season ;;
  }

  dimension: winner {
    type: string
    sql: ${TABLE}.Winner ;;
  }

  measure: count {
    type: count
    drill_fields: [matchday_id, arena.arena_id, arena.arena_name, games.count]
  }
}
