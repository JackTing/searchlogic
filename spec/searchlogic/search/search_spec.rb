require 'spec_helper'

describe Searchlogic::Search::SearchProxy::Base do 
  before(:each) do 
    @james = User.create(:name=>"James", :age =>20, :username =>"jvans1")
    @james = User.create(:name=>"James Vanneman", :age =>21, :username =>"jvans1")

    @ben = User.create(:name=>"Ben")
  end

  describe "Proxy Object" do 
    it "has reader" do
      search = User.search(:name_like => "James", :age_gt => 20, :username_eq => "jvans1")
      james = search.all
      name = james.map(&:name)
      name.should eq(["James Vanneman"])
    end
  end
end