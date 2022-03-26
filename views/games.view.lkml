view: games {
  sql_table_name: `uudd_uno.games`
    ;;
  drill_fields: [game_id]

  dimension: game_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Game_ID ;;
  }

  dimension: match_end {
    type: string
    sql: ${TABLE}.Match_End ;;
  }

  dimension: match_start {
    type: string
    sql: ${TABLE}.Match_Start ;;
  }

  dimension: matchday_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.Matchday_ID ;;
  }

  dimension: winner {
    type: string
    sql: ${TABLE}.Winner ;;
  }

  measure: count {
    type: count
    drill_fields: [game_id, matchdays.matchday_id, gamescore.count]
  }
}
