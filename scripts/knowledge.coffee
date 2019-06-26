# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->
	
   robot.catchAll (res) ->
     pos = res.message.text.indexOf "@catch"
     if pos == 0
       robot.http("http://localhost:8081/knowledge-base/knowledge/hubot?content=#{res.message.text}")
         .get() (err, resp, body) ->
           if err
             res.send "亲，知识库无法连接，请联系管理员"
             return
           res.send "#{body}"