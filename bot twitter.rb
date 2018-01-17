require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 
  config.consumer_secret     = 
  config.access_token        = 
  config.access_token_secret = 
end

journalists = ["mweill", "tomisuper", "camcrosnier", "valentineoberti", "azzahmedchaouch", "vincentdedienne", "panayotispascot", "liliahassaine", "teamyannbarthes"]

jurnalists = journalists.join(" @")

journalists.each do |journalist|
	client.follow(journalist)
end

journalists.each do |journalist|
	tweet_id = client.user_timeline(journalist)
	puts (tweet_id)
	client.favorite(tweet_id)
end

client.update("Bonjour, je suis élève à The Hacking Project (thp), une formation gratuite au code et je viens de faire un bot Twitter. Trop cool non ?! @" + jurnalists)