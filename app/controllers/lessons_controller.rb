class LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
    @sections = Section.all
  end

  def create
    @lesson = Lesson.new(lessons_params)
    if @lesson.save
      flash[:notice] = "Lesson added"
      redirect_to chapters_path
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
    params.require(:lesson).permit(:name, :content, :section_id)
  end

end
