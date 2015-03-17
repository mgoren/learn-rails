class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
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

private
  def chapters_params
    params.require(:chapter).permit(:name)
  end

end
