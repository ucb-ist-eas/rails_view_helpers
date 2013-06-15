require 'spec_helper'

describe NilClass do
  
  it "no args - normal behavior" do
    nil.to_s.should == ''
  end
  
  it "recognized format" do
    nil.to_s(:short).should == ''
  end
  
  it "unrecognized format" do
    expect { nil.to_s(:bogus) }.to raise_error(ArgumentError)
  end
  
  it "too many args" do
    expect { nil.to_s('foo', 'bar') }.to raise_error(ArgumentError)
  end
end