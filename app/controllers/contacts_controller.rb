class ContactsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        flash.now[:error] = ""
       else
        flash[:error] = "Cannot send message"
        render :new
      end

  end
end
