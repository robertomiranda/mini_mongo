require "spec_helper"

describe "Base" do

  before do
    @post1 = Post.insert({:author => "Chuck Norris"})
    @post2 = Post.find(:author => "Chuck Norris").first
  end

  describe "<=>" do
    it "return  Integer  -1, 0, 1" do
      (@post1 <=> @post2).should == 0
    end
  end

  describe "==" do
    it "return True if the ids are equal, false if not" do
      @post1.should == @post2
    end
  end

  describe "===" do
    it "return True if the classes are equal, false if not" do
      @post1.should === @post2
    end
  end

  describe "eql?" do
    it "return True if equal, false if not" do
      @post1.eql?(@post2).should == true
    end
  end
end
