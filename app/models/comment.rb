class Comment < ActiveRecord::Base
  belongs_to :user

  belongs_to :version
  has_one :document, through: :version
end
