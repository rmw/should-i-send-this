class DocumentsController < ApplicationController
  def index
  end

  def create
    p params

    # parse params // separate Doc creation and Version creation

  end

  def new
  end

  def edit
  end

  def show
    # make API call
    @document = Document.find(params[:id])
    @versions = @document.versions.order(version_number: :desc)
  end

  def update
  end

  def destroy
  end

  private

  def document_params
  end
end
