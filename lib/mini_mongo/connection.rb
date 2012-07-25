require "uri"
require "mongo"
module MiniMongo
  module Connection
    def database_url=(url)
      @@database_url = url
    end

    def db_connection
      db = URI.parse(@@database_url)
      db_name = db.path.gsub(/^\//, '')
      @@db_connection ||= Mongo::Connection.new(db.host, db.port, :slave_ok => true).db(db_name)
      @@db_connection.authenticate(db.user, db.password) if db.user && !db.user.empty?
      @@db_connection
    end
  end
end
