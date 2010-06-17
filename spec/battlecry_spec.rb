require File.dirname(__FILE__) + "/helper"

describe Battlecry do

  before do
    @battlecry = Battlecry.new [{ :host => "localhost" }]
  end
  
  it "should have a version" do
      Battlecry.const_defined?("VERSION").should == true
  end

  it "should take a list of allies" do
      @battlecry.num_allies.should equal(1)
  end

  it "should shout" do
      @battlecry.should respond_to(:shout)
  end
 
  it "should allow additional allies" do
      @battlecry.should respond_to(:add_ally)
  end
  
  it "should increase the army size when adding an ally" do
      @battlecry.add_ally "site.com"
      @battlecry.num_allies.should equal(2)
  end
  
  it "should shout and show a growl" do
      @battlecry.shout "Test"
  end
end