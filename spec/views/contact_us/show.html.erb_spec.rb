require 'rails_helper'

RSpec.describe "contact_us/show", type: :view do
  before(:each) do
    @contact_u = assign(:contact_u, ContactU.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
