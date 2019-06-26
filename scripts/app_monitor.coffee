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

   # A应用
   annoyIntervalA = null
   robot.hear /开始监听A应用/i, (res) ->
     if annoyIntervalA
       robot.http("http://localhost:8088/hubot/heart-a")
        .get() (err, resp, body) ->
          if err
            res.send "A应用异常，错误信息: #{err}。\n推荐解决方案如下：\n1.重启应用，执行命令run hastart。\n2.查看网络情况。"
            return
     res.send "好的，A应用监听中。。。"
     annoyIntervalA = setInterval () ->
       robot.http("http://localhost:8088/hubot/heart-a")
        .get() (err, resp, body) ->
          if err
            res.send "A应用异常，错误信息: #{err}。\n推荐解决方案如下：\n1.重启应用，执行命令run hastart。\n2.查看网络情况。"
     , 5000
	 
   robot.hear /停止监听A应用/i, (res) ->
     if annoyIntervalA
       res.send "好的，A应用监听已经停止。。。"
       clearInterval(annoyIntervalA)
       annoyIntervalA = null
     else
       res.send "目前A应用没有处于监听中"

   robot.hear /查看A应用状态/i, (res) ->
     robot.http("http://localhost:8088/hubot/heart-a")
      .get() (err, resp, body) ->
        if err
          res.send "A应用异常，错误信息: #{err}。\n推荐解决方案如下：\n1.重启应用，执行命令run hastart。\n2.查看网络情况。"
          return
	       res.send "A应用正常"


   # B应用
   annoyIntervalB = null
   robot.hear /开始监听B应用/i, (res) ->
     if annoyIntervalB
       robot.http("http://localhost:8089/hubot/heart-b")
        .get() (err, resp, body) ->
          if err
            res.send "B应用异常，错误信息: #{err}。\n推荐解决方案如下：\n1.重启应用，执行命令run hbstart。\n2.查看网络情况。"
            return
     res.send "好的，B应用监听中。。。"
     annoyIntervalB = setInterval () ->
       robot.http("http://localhost:8089/hubot/heart-b")
        .get() (err, resp, body) ->
          if err
            res.send "B应用异常，错误信息: #{err}。\n推荐解决方案如下：\n1.重启应用，执行命令run hbstart。\n2.查看网络情况。"
     , 5000
	 
   robot.hear /停止监听B应用/i, (res) ->
     if annoyIntervalB
       res.send "好的，B应用监听已经停止。。。"
       clearInterval(annoyIntervalB)
       annoyIntervalB = null
     else
       res.send "目前B应用没有处于监听中"

   robot.hear /查看B应用状态/i, (res) ->
     robot.http("http://localhost:8089/hubot/heart-b")
      .get() (err, resp, body) ->
        if err
          res.send "B应用异常，错误信息: #{err}。\n推荐解决方案如下：\n1.重启应用，执行命令run hbstart。\n2.查看网络情况。"
          return
	       res.send "B应用正常"
	 
