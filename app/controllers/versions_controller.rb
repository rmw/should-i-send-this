class VersionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def create
  end

  def new
    @document = Document.find(params[:document_id])
    @version = Version.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def version_params
    content = params[:document][:versions][:content]
    {content: content}
  end
end
