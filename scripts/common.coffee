# Description:
#   公共模块
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

   robot.hear /badger/i, (res) ->
     res.reply "good"
	 
   robot.respond /badger/i, (res) ->
     res.send "nice"
	 
   robot.hear /open the (.*) doors/i, (res) ->
    doorType = res.match[2]
	
    if doorType is "pod bay"
      res.reply "I'm afraid I can't let you do that.#{doorType}"
    else
      res.reply "Opening #{doorType} doors"
	  
   lulz = ['lol', 'rofl', 'lmao']
   robot.hear /random/i, (res) ->
     res.send res.random lulz

   robot.hear /delay/, (res) ->
    setTimeout () ->
      res.send "delay responsed you"
    , 5000
	
   annoyIntervalId = null
   robot.hear /annoy me/, (res) ->
    if annoyIntervalId
      res.send "noise"
      return
    res.send "Ok，I will annoy you"
    annoyIntervalId = setInterval () ->
      res.send "noise"
    , 5000
   robot.hear /stop me/, (res) ->
    if annoyIntervalId
      res.send "Ok"
      clearInterval(annoyIntervalId)
      annoyIntervalId = null
    else
      res.send "I don't annoy you"
	 
   robot.listen(
     (message) -> # Match function
       message.user.name is "Shell" and message.text is "listen" and Math.random() > 0.1
     (res) -> # Standard listener callback
       res.reply "hell,match rate is #{res.match * 100}%"
   )
   
   robot.hear /event test/i, (res) ->
    args = { id: "12345"}
    robot.emit "wow", args

   robot.on "wow", (args) ->
    robot.logger.info "#{args.id}"
	
   robot.error (err, res) ->
    robot.logger.error "DOES NOT COMPUTE"
	
   robot.hear /add num/i, (res) ->
     num = robot.brain.get('totalNum') * 1 or 0
     if num > 4
       res.reply "I'm too fizzy.."
     else
       res.reply 'Sure!'
       robot.brain.set 'totalNum', num+1
  
   robot.hear /sleep it off/i, (res) ->
     robot.brain.set 'totalNum', 0
     res.reply 'zzzzz'
	 
   robot.hear /green eggs/i, (res) ->
    room = "=bxhxX"
    robot.messageRoom room, "I do not like green eggs and ham.  I do not like them sam-I-am."
   