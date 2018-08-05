#https://learn.skillcrush.com/module-20/ping-pong/

require 'socket'

server = 'irc.freenode.net'
port = 6667
socket = TCPSocket.open(server, port)

nickname = 'SkillcrushBotOMG'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} O * #{nickname}"

while message = socket.gets do
  puts message

  if message.match('^PING :')

    server = message.split(':').last

    puts "PONG #{server}"

    socket.puts "PONG #{server}"
  end
end
