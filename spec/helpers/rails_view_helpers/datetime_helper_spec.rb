require 'spec_helper'

describe RailsViewHelpers::DatetimeHelper do
  
  describe '#datetime_to_s' do
    before {Time.zone = 'Pacific Time (US & Canada)'}
    it "nil" do
      datetime_to_s(nil, :db).should == ''
    end
    
    it "datetime" do
      datetime =Time.zone.parse('2000-01-02 03:04:05')
      datetime_to_s(datetime, :db).should == '2000-01-02 03:04:05'
    end
    
    it "date" do
      date =Time.zone.parse('2000-01-02').to_date
      datetime_to_s(date, :db).should == '2000-01-02'
    end
  end
  
end