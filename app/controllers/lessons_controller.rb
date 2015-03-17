class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lessons_params)
    if @lesson.save
      flash[:notice] = "Lesson added"
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

private
  def lessons_params
    params.require(:lesson).permit(:name, :content)
  end

end
