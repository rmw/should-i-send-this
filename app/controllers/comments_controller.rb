class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    # TODO - User implemented for testing, need to remove after creating sessions_controller
    user = User.all.sample

    version = Version.find(params[:version_id])

    comment = Comment.new(comment_params)
    comment.version = version
    comment.user = user
    comment.save

    redirect_to document_path(params[:document_id])
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
