require 'boilerplate'

connection = Chronologic::Client::Connection.new('http://localhost:7979')

event = Chronologic::Client::Event.new
event.key = "story_1"
event.data = {
  "headline" => "First ever post in Chronologic!",
  "lede" => "A monumental occasion for housecats everywhere.",
  "body" => "There is currently a cat perched on my arm. This is normal, carry on!"
}
event.timelines = ['home']
event.objects = []

connection.publish(event)

feed = connection.timeline('home')

puts "We found #{feed['count']} events."
puts "That event looks just like this:"
pp feed['items'].first

