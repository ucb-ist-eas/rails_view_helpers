require 'spec_helper'

describe RailsViewHelpers::HtmlHelper do
  def h(*args);helper.send(:h, *args).inspect;end
  
  describe '#body_tag' do
    it "puts controller and action in body" do
      helper.stub(controller: double('controller', controller_name: 'cn', action_name: 'an'))
      html = helper.body_tag() { 'content' }

      Capybara.string(html).find('body', text: 'content').tap do |body|
        body["data-controller"].should == 'cn'
        body["data-action"].should == 'an'
      end
    end

    it "with options" do
      helper.stub(controller: double('controller', controller_name: 'cn', action_name: 'an'))
      html = helper.body_tag(id: 'my-id', class: 'my-class', data: {my: 'my-data'}) { 'content' }

      Capybara.string(html).find('body.my-class#my-id', text: 'content').tap do |body|
        body["data-controller"].should == 'cn'
        body["data-action"].should == 'an'
        body["data-my"].should == 'my-data'
      end
    end
  end
  
  describe '#boolean' do
    it "true" do
      bln(true).should == '&#10004;'
    end
    
    it "false" do
      bln(false).should == nbsp
    end
    
    it "custom true string" do
      bln(true, 'T').should == 'T'
    end
    
    it "custom false string" do
      bln(false, 'T', 'F').should == 'F'
    end
  end
  
  describe '#nbsp' do
    it "returns &nbsp;" do
      nbsp.should == '&nbsp;'
    end
    
    it "html_safe" do
      nbsp.should be_html_safe
    end
    
    it "returns multiiple" do
      nbsp(2).should == '&nbsp;&nbsp;'
    end
  end
  
  describe '#td_bln' do
    def td_bln(*args); helper.td_bln(*args); end
    
    it "true" do
      html = td_bln(true, 'x')
      Capybara.string(html).find('td.c', text: 'x')
    end
    
    it "options" do
      html = td_bln(true, 'y', id: 'my-id', class: 'my-class')
      Capybara.string(html).find('td.c.my-class[id="my-id"]', text: 'y')
    end
  end
  
  describe '#th_actions' do
    def th_actions(*args); helper.th_actions(*args); end
    
    it "default" do
      html = th_actions
      Capybara.string(html).find('th.c[colspan="1"]', text: 'Actions')
    end
    
    it "change colspan" do
      html = th_actions(2)
      Capybara.string(html).find('th.c[colspan="2"]', text: 'Actions')
    end
    
    it "change text" do
      html = th_actions(1, 'Verbs')
      Capybara.string(html).find('th.c[colspan="1"]', text: 'Verbs')
    end

    it "different class, id" do
      html = th_actions(class: 'foo', id: 'my-id')
      Capybara.string(html).find('th.foo#my-id', text: 'Actions')
    end
  end
end