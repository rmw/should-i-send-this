class Version < ActiveRecord::Base
  validates :document_id, presence: true
  validates :content, presence: true

  ### TODO: validate content uniqueness against previous versions of itself

  after_validation :assign_version_number

  belongs_to :document


  private

  def assign_version_number
    document = Document.find(self.document_id)
    if document.versions.empty?
      self.version_number = 1
    else
      self.version_number = ( document.versions.maximum(:version_number) + 1 )
    end
  end

end
