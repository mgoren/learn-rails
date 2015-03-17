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

  # def edit
  #   @chapter = Chapter.find(params[:chapter_id])
  #   @section = Section.find(params[:id])
  # end
  #
  # def update
  #   @chapter = Chapter.find(params[:chapter_id])
  #   @section = Section.find(params[:id])
  #   @section.update(sections_params)
  #   if @section.save
  #     flash[:notice] = 'Cool. Good job updating.'
  #     redirect_to chapter_section_path(@chapter, @section)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @chapter = Chapter.find(params[:chapter_id])
  #   @section = Section.find(params[:id])
  #   @section.destroy
  #   flash[:notice] = "Killed it."
  #   redirect_to chapters_path
  # end

private
  def sections_params
    params.require(:section).permit(:name, :chapter_id)
  end

end
