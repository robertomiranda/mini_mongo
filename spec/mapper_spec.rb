require "spec_helper"
describe "Mapper" do
  def post_attributes
    {:author => "Chuck Norris"}
  end

  let!(:post){ Post.insert(post_attributes) }

  describe "#insert" do
    it "create a new Document" do
      expect do
        post = Post.insert(post_attributes)
      end.to change(Post, :count).by(1)
    end
  end

  describe "#find" do
    it "returns the document" do
      Post.find(:author => "Chuck Norris").should == [post]
    end

    it "raise Document not found" do
      proc { Post.find(:author => "Chuck Norri") }.should raise_error(MiniMongo::DocumentNotFound)
    end
  end

  describe "#update" do
    pending
  end

  describe "#remove" do
    it "destroy the document" do
      expect do
        Post.remove(post.id)
      end.to change(Post, :count).by(-1)
    end
  end

  describe "count" do
    it "return the number of document" do
      post
      Post.count.should == 1
    end
  end

  describe "remove_all" do
    it "destroy all the documents" do
      post
      expect do
        Post.remove_all
      end.to change(Post, :count).by(-1)
    end
  end

end
