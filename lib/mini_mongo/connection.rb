require "uri"
require "mongo"
module MiniMongo
  module Connection
    @@slave_ok = false

    def slave_ok=(attr)
      @@slave_ok = attr
    end

    def database_url=(url)
      @@database_url = url
    end

    def db_connection
      db = URI.parse(@@database_url)
      db_name = db.path.gsub(/^\//, '')
      @@db_connection ||= Mongo::Connection.new(db.host, db.port, :slave_ok => @@slave_ok).db(db_name)
      @@db_connection.authenticate(db.user, db.password) if db.user && !db.user.empty?
      @@db_connection
    end
  end
end
