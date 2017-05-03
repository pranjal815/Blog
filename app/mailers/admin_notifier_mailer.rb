class AdminNotifier < ApplicationMailer
    default from: 'Generic App <pranjaltou@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_notifier_mailer.contact_form.subject
  #
  def contact_form  contact_form
    @contact_form = contact_form

    mail to: "pranjaltou@gmail.com"
  end
end
