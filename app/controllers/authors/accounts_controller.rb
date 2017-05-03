module Authors
  class AccountsController < AuthorController
    def edit
    end

    def update_info
      if current_author.update(author_info_params)
        flash[:success] = 'Congrats!! Successfully updated your information.'
      else
        flash[:danger] = current_author.display_error_message
      end
      redirect_to authors_account_path
    end

    def signup

    end


    def change_password
      author = current_author
      if author.valid_password?(author_password_params[:current_password])
         if author.change_password(author_password_params)
             sign_in(author, bypass: true)
             flash[:success] = "Successfully changed the password!!!"
         else
             flash[:danger] = author.display_error_message
         end
      else
         flash[:danger] = 'Current password is wrong!!'
      end
      redirect_to authors_account_path
    end

    private
    def author_info_params
      params.require(:author).permit(:name, :email, :bio, :avatar,:avatar_cache)
    end

    def author_password_params
      params.require(:author).permit(:current_password, :new_password, :new_password_confirmation)
    end
  end
end