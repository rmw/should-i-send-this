class Document < ActiveRecord::Base
  validates :title, presence: true

  ## TODO - do we want to validate file extensions when they become a feature?

  belongs_to :user
  has_many :versions
end
