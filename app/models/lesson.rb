class Lesson < ActiveRecord::Base
  validates :name, :content, presence: true

  before_create do
    self.number = Lesson.all.length + 1
  end

  def next
    next_number = self.number + 1
    if next_number > Lesson.all.length
      next_number = 1
    end
    return Lesson.find_by number: next_number
  end

  def previous
    previous_number = self.number - 1
    if previous_number < 1
      previous_number = Lesson.all.length
    end
    return Lesson.find_by number: previous_number
  end
end
