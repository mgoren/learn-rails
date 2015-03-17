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

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lessons_params)
    if @lesson.save
      flash[:notice] = 'Cool. Good job updating.'
      redirect_to lesson_path(@lesson)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Killed it."
    redirect_to lessons_path
  end

private
  def lessons_params
    params.require(:lesson).permit(:name, :content)
  end

end
