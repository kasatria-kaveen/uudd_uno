connection: "uudd_uno"

# include all the views
include: "/views/**/*.view"

datagroup: uudd_uno_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: uudd_uno_default_datagroup

explore: players {
  join: teams {
    type: left_outer
    sql_on: ${players.team} = ${teams.team_id} ;;
    relationship: many_to_one
  }

  join: nationalities {
    type: left_outer
    sql_on: ${players.nationality} = ${nationalities.nationality_id} ;;
    relationship: many_to_one
  }

  join: gamescore {
    type: left_outer
    sql_on: ${players.player_id} =  ${gamescore.player_id}  ;;
    relationship: one_to_many
  }

  join: games {
    type: left_outer
    sql_on: ${gamescore.game_id} =  ${games.game_id}  ;;
    relationship: many_to_one
  }
}

explore: games {
  join: gamescore {
    type: left_outer
    sql_on:${games.game_id} = ${gamescore.game_id}  ;;
    relationship: one_to_many
  }

  join: players {
    type: left_outer
    sql_on:${gamescore.player_id} = ${players.player_id}  ;;
    relationship: many_to_one
  }

  join: winner {
    #   from: players
    type: left_outer
    sql_on:${games.winner} = ${winner.player_id}  ;;
    relationship: one_to_one
  }

  join: matchdays {
    type: left_outer
    sql_on: ${games.matchday_id} = ${matchdays.matchday_id} ;;
    relationship: many_to_one
  }

  join: arena {
    type: left_outer
    sql_on: ${matchdays.arena_id} = ${arena.arena_id} ;;
    relationship: many_to_one
  }
}

explore: teams {}

explore: arena {}

explore: nationalities {}

explore:gamescore {
  join: players {
    type: left_outer
    sql_on: ${gamescore.player_id} = ${players.player_id};;
    relationship: many_to_one
  }

  join: games {
    type: left_outer
    sql_on: ${gamescore.game_id} = ${games.game_id} ;;
    relationship: many_to_one
  }

  join: matchdays {
    type: left_outer
    sql_on: ${games.matchday_id} = ${matchdays.matchday_id} ;;
    relationship: many_to_one
  }

  join: winner {
    #   from: players
    type: left_outer
    sql_on:${games.winner} = ${winner.player_id}  ;;
    relationship: one_to_one
  }

  join: arena {
    type: left_outer
    sql_on: ${matchdays.arena_id} = ${arena.arena_id} ;;
    relationship: many_to_one
  }
}

explore: matchdays {
  join: arena {
    type: left_outer
    sql_on: ${matchdays.arena_id} = ${arena.arena_id} ;;
    relationship: many_to_one
  }
}
