view: gamescore {
  sql_table_name: `uudd_uno.gamescore`
    ;;
  drill_fields: [gamescore_id]

  dimension: gamescore_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Gamescore_ID ;;
  }

  dimension: game_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.Game_ID ;;
  }

  dimension: player_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.Player_ID ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.Score ;;
  }


  measure: games {
    type: count
    label: "Games Played"
    drill_fields: [games.game_id, games.starter, games.winner]
  }

  measure: points {
    type: sum
    label: "Points"
    sql: ${TABLE}.score ;;
  }

  measure: wins {
    type: count
    label: "Wins"
    filters: [score: ">0"]
  }

  measure: cumulative_points {
    type: running_total
    sql: ${points} ;;
  }

}
