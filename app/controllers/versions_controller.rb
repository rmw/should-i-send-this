class VersionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
  end

  def new
    @document = Document.find(params[:document_id])
    @version = Version.new
    @most_recent_version = @document.versions.last
    @comments = @most_recent_version.comments
  end

  def edit
  end

  def show
    @version = Version.find(params[:id])

    @document = Document.find(@version.document_id)

    @versions = @document.versions

    @comments = @version.comments.order(created_at: :desc)
    @comment = @version.comments.build

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
    version = Version.find(params[:id])

    document = Document.find(version.document_id)

    latest_version = document.versions.last

    if version == latest_version
      version.destroy
      redirect_to document_path(document)
    else
      version.destroy
      redirect_to version_path(latest_version)
    end
  end

  private

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
