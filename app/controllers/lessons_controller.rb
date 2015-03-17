class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end


private
  def lessons_params
    params.require(:lesson).permit(:name, :content)
  end

end
