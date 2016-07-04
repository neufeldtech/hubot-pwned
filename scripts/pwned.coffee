# Description:
#   Find out if an email address has been pwned
#
# Configuration:
#
# Commands:
#  has <email> been pwned?
#  is <email> pwned?
#
# Notes:
#  https://haveibeenpwned.com/
#
# Author:
#   Jordan Neufeld <myjc.niv@gmail.com> https://github.com/neufeldtech
#

module.exports = (robot) ->
  robot.hear /(?:has|is) (\S+@\w+\.\w+) (?:been )?pwned\??/i, (msg) ->
    email = msg.match[1]
    robot.http("https://haveibeenpwned.com/api/v2/breachedaccount/"+email)
    .get() (err, res, body) ->
      if err
        res.send "Encountered an error :( #{err}"
        return
      else
        if res.statusCode == 200
          body = JSON.parse(body)
          pwnedSites = ""
          i = 0
          while i < body.length
            pwnedSites += "#{body[i].Domain}\n"
            i++
          msg.send "Yes, #{email} has been pwned :sob:\n```#{pwnedSites}```"
          return
        else if res.statusCode == 404
          msg.send "Nope, #{email} has not been pwned :tada:"
          return
        else
          msg.send "Encountered an error :("
          return
