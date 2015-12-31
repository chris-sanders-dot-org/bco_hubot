# Description:
#   Gives Nagra the ability to restart via chat command.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#  nagra die - Nagra dies.  Immediately.  There are no warnings.  He just dies.
#
# Author:
#   Lummoxx

module.exports = (robot) ->

  #robot.hear /jarvis.*die/i, (msg) ->
  robot.hear /nagra die/i, (msg) ->
    process.exit 0
