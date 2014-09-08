class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])

    if @user == current_user
      @documents = @user.documents
    else
      @documents = @user.documents.where(privacy: false)
    end
  end

end
