module MiniMongo
  # Stores runtime configuration information.
  #
  # @example Standard settings
  #     MiniMongo.configure do |config|
  #       config.database_url          = "mongodb://user:pass@localhost:27017/posts"
  #     end
  #
  # @see MiniMongo.configure
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :slave_ok, :db_name, :db_user, :db_host, :db_port, :db_password
    attr_reader :database_url

    def database_url=(url)
      @database_url = url
      db_info = URI.parse(@database_url)
      @db_name = db_info.path.gsub(/^\//, '')
      @db_user = db_info.user
      @db_password = db_info.password
      @db_host = db_info.host
      @db_port = db_info.port
    end

  end
end
