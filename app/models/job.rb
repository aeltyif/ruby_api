class Job < ApplicationRecord
  belongs_to :user
  has_many :applicant
  validates_presence_of :title, :body
end
