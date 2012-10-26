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
      @@db_info = URI.parse(@@database_url)
      @@db_name = @@db_info.path.gsub(/^\//, '')
      @@db_user = @@db_info.user
      @@db_password = @@db_info.password
    end

    def db_name
      @@db_name
    end

    def db_connection
      @@db_connection ||= Mongo::Connection.new(@@db_info.host, @@db_info.port, :slave_ok => @@slave_ok).db(@@db_name)
      @@db_connection.authenticate(@@db_info.user, @@db_info.password) if @@db_info.user && !@@db_info.user.empty?
      @@db_connection
    end

    def drop
      self.db_connection.drop_database(@@db_name)
    end
  end
end
