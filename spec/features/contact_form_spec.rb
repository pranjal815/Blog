require '../../spec/features/acceptance_helper'

feature 'Contact Form' do
  before do
    # check the emails
    clear_emails
  end

  scenario 'User submits contact form, it saves input to the database and emails the admin' do
    # go to the page
    visit contact_us_path

    #Submit form with no-data
    within 'form.user-form' do
      click_on 'Submit'
    end

    expect(page).to have_css 'form.user-form .field_with_errors'

    # Fill in the form
    within 'form.user-form' do
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Message', with: 'Apple peanut butter'

      click_on 'Submit'
    end

    # The form should have submitted ok, so tell the user that.
    expect(page).to have_content 'Contact received'

    # There should be a message in the database
    expect(ContactForm.count).to eq(1)

    # It notified the admin of the site via email
    open_email 'pranjaltou@gmail.com'
    expect(current_email.header('Subject')).to eq 'Message from contact form'
    expect(current_email).to have_content 'Apple peanut butter'
  end
end