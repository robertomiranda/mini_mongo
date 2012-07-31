module MiniMongo
  class MiniMongoError < StandardError
  end

  class DocumentNotFound < MiniMongoError
  end
end
