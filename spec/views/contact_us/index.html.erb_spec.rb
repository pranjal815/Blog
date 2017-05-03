require 'rails_helper'

RSpec.describe "contact_us/index", type: :view do
  before(:each) do
    assign(:contact_us, [
      ContactU.create!(),
      ContactU.create!()
    ])
  end

  it "renders a list of contact_us" do
    render
  end
end
