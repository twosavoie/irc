#https://learn.skillcrush.com/module-20/ping-pong/
#ok making a change...
#see this is a different change

require 'socket'

server = 'moon.freenode.net'
port = 6667
socket = TCPSocket.open(server, port)

nickname = 'SkillcrushBotOMG'
channel = '#twos22'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} O * #{nickname}"
socket.puts "JOIN #{channel}"
socket.puts "PRIVMSG #{channel} :Really?!" #irc response when I run script

while message = socket.gets do
  puts message

  if message.match('^PING :')
    server = message.split(':').last
    puts "PONG #{server}"
    socket.puts "PONG #{server}"
  elsif message.match('Does this work?') #this has to match what I type into freenode.net
    puts "PRIVMSG #{channel} :This Works!"
    socket.puts "PRIVMSG #{channel} :This Works!" #responce to message.match
  end
end
