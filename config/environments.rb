#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
configure :production, :development do
	db = URI.parse(ENV['postgres://yehgshuigjxvdi:728ea280e13b912a1cb943dd56bcad2c5099599191ab61ff1774ce0fb65cef5a@ec2-50-17-250-38.compute-1.amazonaws.com:5432/d1lir2f9qe7o8
'] || 'postgres://grill:panther@localhost:8080/guestbook')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)
end