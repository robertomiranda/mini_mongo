require "json"
class MiniMongo::Base
  include MiniMongo::Mapper

  def initialize(attrs = {})
    attrs["id"] = attrs["_id"].to_s
    attrs.delete("_id")
    attrs.each do |key, value|
      instance_variable_set("@#{key}", value)
      self.instance_eval("def #{key};@#{key};end")
      self.instance_eval("def #{key}=(val);@#{key}=val;end")
    end
    self.instance_eval("def to_json;#{attrs}.to_json;end")
  end
end
