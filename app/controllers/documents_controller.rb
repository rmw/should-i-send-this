class DocumentsController < ApplicationController
  def index
    @document = Document.new()
  end

  def create
  end

  def new
    @document = Document.new()
    @version = Version.new()
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

  def document_params
  end
end
