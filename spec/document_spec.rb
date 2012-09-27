require "spec_helper"
describe "Document" do
  def post_attributes
    {}
  end

  it "should create a new Document" do
    post = Post.insert({:author => "Chuck Norris"})
  end
end
