class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
    @sections = Section.all
    @lessons = Lesson.all
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapters_params)
    if @chapter.save
      flash[:notice] = "Chapter added"
      redirect_to chapters_path
    else
      render :new
    end
  end

  # def edit
  #   @chapter = Chapter.find(params[:id])
  # end
  #
  # def update
  #   @chapter = Chapter.find(params[:id])
  #   @chapter.update(chapters_params)
  #   if @chapter.save
  #     flash[:notice] = 'Cool. Good job updating.'
  #     redirect_to chapter_path(@chapter)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @chapter = Chapter.find(params[:id])
  #   @chapter.destroy
  #   flash[:notice] = "Killed it."
  #   redirect_to chapters_path
  # end

private
  def chapters_params
    params.require(:chapter).permit(:name)
  end

end
