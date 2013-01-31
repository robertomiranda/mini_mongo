require "spec_helper"

describe "Configuration" do
  it "should set the configuration vars from database url" do
    MiniMongo.configure do |config|
      config.database_url = "mongodb://:@localhost:27017/posts"
    end
    MiniMongo.configuration.db_name.should == "posts"
  end

  it "should set configuration vars" do
    MiniMongo.configure do |config|
      config.db_user = "roberto"
    end
    MiniMongo.configuration.db_user.should == "roberto"
  end
end
