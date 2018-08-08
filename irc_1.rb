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
socket.puts "PRIVMSG #{channel} :Really?!"

while message = socket.gets do
  puts message

  if message.match('^PING :')
    server = message.split(':').last
    puts "PONG #{server}"
    socket.puts "PONG #{server}"
  elsif message.match('How are you?')
    puts "PRIVMSG #{channel} :I'm great, thanks!"
  end
end
