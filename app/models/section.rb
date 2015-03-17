class Section < ActiveRecord::Base
  validates :name, :chapter_id, presence: true
  has_many :lessons
  belongs_to :chapter

end
