require 'rails_helper'

RSpec.describe "contact_us/edit", type: :view do
  before(:each) do
    @contact_u = assign(:contact_u, ContactU.create!())
  end

  it "renders the edit contact_u form" do
    render

    assert_select "form[action=?][method=?]", contact_u_path(@contact_u), "post" do
    end
  end
end
