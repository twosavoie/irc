#https://learn.skillcrush.com/module-20/ping-pong/
#I don't know if this branch thing is working or not
require 'socket'

server = 'moon.freenode.net'
port = 6667
socket = TCPSocket.open(server, port)

nickname = 'SkillcrushBotOMG'
channel = '#twos22'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} O * #{nickname}"
socket.puts "JOIN #{channel}"
socket.puts "PRIVMSG #{channel} :This Works!"

while message = socket.gets do
  puts message

  if message.match('^PING :')
    server = message.split(':').last
    puts "PONG #{server}"
    socket.puts "PONG #{server}"
  end
end
