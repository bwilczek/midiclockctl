# frozen_string_literal: true

require 'childprocess'
require 'osc-ruby'

unless File.executable?('./midiclock-master/midiclock')
  `./get_midiclock.sh`
end

port = 4942 # maybe one day find a free port dynamically
tempo = 120 # maybe one day pull from ARGV

process = ChildProcess.build('./midiclock-master/midiclock', '-t', tempo.to_s, '-p', port.to_s, '-s')
process.start

client = OSC::Client.new('localhost', port)

puts <<~TXT
midiclock has been started in background with BPM 120
Connect it to your instruments using QJackCtl or a similar tool

Commands:
q : quit
s : stop clock
p : start clock
number : change tempo to given value
TXT

loop do
  print '> '
  cmd = gets.chomp
  case cmd
  when 'p'
    puts 'Start clock'
    client.send(OSC::Message.new('/start'))
  when 's'
    puts 'Stop clock'
    client.send(OSC::Message.new('/stop'))
  when /\d+/
    puts "Set tempo to #{cmd.to_i}"
    client.send(OSC::Message.new('/tempo', cmd.to_i))
  when 'q'
    break
  else
    puts "Unknown command: #{cmd}"
  end
end

# Stop midiclock ChildProcess
process.stop
