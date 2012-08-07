require "mini_mongo"
MiniMongo.database_url = "mongodb://:@localhost:27017/posts"
class Post < MiniMongo::Base
  maps :posts
end

# Post.insert({:author => "Chuck Norris"})
# => #<Post:0x007fe5240f42c0 @id="5016af53bda74305f1000002", @author="Chuck Norris">

# Post.find("id" => "5016af53bda74305f1000002")
# => #<Post:0x007fe5240cc360 @id="5016af53bda74305f1000002", @author="Chuck Norris">
#
# Post.update("5016af53bda74305f1000002", "author" => "chuck norris")
# => #<Post:0x007fdc7c171c80 @author="chuck norris", @id="5016af53bda74305f1000002">
#
#Post.count
# => 1
#
#Post.remove("5016af53bda74305f1000002")
# => true
#
#Post.remove_all
# => true
#
class Answer < MiniMongo::Base
  maps :answers
end
