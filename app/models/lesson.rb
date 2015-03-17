class Lesson < ActiveRecord::Base
  validates :name, :content, presence: true
  belongs_to :section
  scope :in_order, -> { order("number ASC") }
  scope :desc_order, -> { order("number DESC") }

  before_create do
    if Lesson.any?
      self.number = Lesson.last.number + 1
    else
      self.number = 1
    end
  end

  def next
    if self == self.section.lessons.last
      return self.section.lessons.first
    else
      return self.section.lessons.in_order.where("number > ?", self.number).first
    end
  end

  def previous
    if self == self.section.lessons.first
      return self.section.lessons.last
    else
      return self.section.lessons.desc_order.where("number < ?", self.number).first
    end
  end

end
