game_spreadsheet = "https://docs.google.com/spreadsheets/d/1PZu9myDKv_ZZ7D107Ty-w0vgQCxvGZ7oN0g98-vENso/edit?usp=sharing_eid&ts=567c28d7"

module.exports = (robot) ->
  robot.hear /game spreadsheet/i, (msg) ->
    msg.send game_spreadsheet
