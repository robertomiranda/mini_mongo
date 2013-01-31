require "uri"
require "mongo"

module MiniMongo
  module Connection

    def db_connection
      @@db_connection ||= Mongo::Connection.new(
        MiniMongo.configuration.db_host,
        MiniMongo.configuration.db_port,
        :slave_ok => MiniMongo.configuration.slave_ok)
        .db(MiniMongo.configuration.db_name)
      authenticate_user
      @@db_connection
    end

    def drop
      self.db_connection.drop_database(@@db_name)
    end

    def authenticate_user
      @@db_connection.authenticate(
        MiniMongo.configuration.db_user,
        MiniMongo.configuration.db_password)if MiniMongo.configuration.db_user&& !MiniMongo.configuration.db_user.empty?
    end
  end
end
