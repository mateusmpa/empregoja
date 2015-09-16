class Job < ActiveRecord::Base
  belongs_to :company

  validates :company, :title, :location, :category, :description, presence: true

  def featured?
    featured
  end
end
