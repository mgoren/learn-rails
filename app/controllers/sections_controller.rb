class SectionsController < ApplicationController

  def new
    @section = Section.new
    @chapters = Chapter.all
  end

  def create
    @section = Section.new(sections_params)
    if @section.save
      flash[:notice] = "Section added"
      redirect_to chapters_path
    else
      render :new
    end
  end

private
  def sections_params
    params.require(:section).permit(:name, :chapter_id)
  end

end
