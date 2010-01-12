require File.dirname(__FILE__) + '/../spec_helper'

describe NestedForm::Builder do
  describe "with no options" do
    before(:each) do
      @project = Project.new
      @template = ActionView::Base.new
      @builder = NestedForm::Builder.new(:item, @project, @template, {}, proc {})
    end
  
    it "should have an add link" do
      @builder.link_to_add("Add", :tasks).should == '<a href="javascript:void(0)" class="add_nested_fields" data-association="tasks">Add</a>'
    end
  
    it "should have a remove link" do
      @builder.link_to_remove("Remove").should == '<input id="item__destroy" name="item[_destroy]" type="hidden" /><a href="javascript:void(0)" class="remove_nested_fields">Remove</a>'
    end
  end
end