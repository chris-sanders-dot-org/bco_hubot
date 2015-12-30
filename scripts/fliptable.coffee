places = [
  "(ノ ゜Д゜)ノ ︵ ┻━┻",
  "(╯°□°)╯︵ ┻━┻ ︵ ╯(°□° ╯)",
  "(ﾉಥ益ಥ）ﾉ﻿ ┻━┻",
  "(╯°□°）╯ ┻━┻"
]

module.exports = (robot) ->
  robot.hear /fliptable/i, (msg) ->
    msg.send msg.random places
