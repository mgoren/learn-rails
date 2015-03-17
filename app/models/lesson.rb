class Lesson < ActiveRecord::Base
  validates :name, :content, presence: true
end
