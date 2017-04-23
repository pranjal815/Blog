class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        flash.now[:error] = "Thank You"
      else
        flash[:error] = "Cannot send message"
        render :new
      end
  end
end
