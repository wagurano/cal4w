# frozen_string_literal: false
require "rails_helper"

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
                     subject: "MyString",
                     place: "MyString",
                     description: "MyText",
                     user: create(:user)
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select 'input#event_subject[name=?]', "event[subject]"

      assert_select 'input#event_place[name=?]', "event[place]"

      assert_select 'textarea#event_description[name=?]', "event[description]"
    end
  end
end
