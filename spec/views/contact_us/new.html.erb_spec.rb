require 'rails_helper'

RSpec.describe "contact_us/new", type: :view do
  before(:each) do
    assign(:contact_u, ContactU.new())
  end

  it "renders new contact_u form" do
    render

    assert_select "form[action=?][method=?]", contact_us_path, "post" do
    end
  end
end
