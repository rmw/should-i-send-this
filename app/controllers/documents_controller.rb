class DocumentsController < ApplicationController
  def index
    @document = Document.new()
  end

  def create
    document = Document.create(document_params)
    document.versions.create(version_params)

    redirect_to document_path(document)
  end

  def new
    @document = Document.new()
    @version = Version.new()
  end

  def edit
  end

  def show
    # make API call
    @document = Document.find(params[:id])
    @current_version = @document.versions.order(version_number: :desc).first
    # @alchemist = AlchemyData.new(@current_version.content)

    # UNCOMMENT BELOW FOR NON-API CALL DEVELOPER MODE
    @alchemist = FakeAlchemist.new

    @keywords = @alchemist.keywords
    @concepts = @alchemist.concepts
    @sentiment = @alchemist.sentiment
  end

  def update
  end

  def destroy
  end

  private

  ## TODO:  The below methods are pretty hacky, but achieve similar ends to strong params
  # is there a better WORKING way to get at nested resources in form submission?

  def document_params
    title = params[:document][:title]
    context = params[:document][:context]
    {title: title, context: context}
  end

  def version_params
    content = params[:document][:versions][:content]
    {content: content}
  end

end


# BELOW IS A DEVELOPMENT OBJECT TO AVOID REPEATED API CALLS
class FakeAlchemist
  attr_reader :keywords, :concepts, :sentiment

  def initialize
    @keywords = ["hot dogs", "salty", "buns", "mention", "thoughts", "MIND", "buns."]
    @concepts = ["2000 albums"]
    @sentiment = -0.393271
  end

end

