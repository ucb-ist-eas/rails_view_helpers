require 'spec_helper'

describe RailsViewHelpers::JavascriptHelper do
  
  it "js_void" do
    js_void.should == 'javascript:void(0)'
  end
  
end