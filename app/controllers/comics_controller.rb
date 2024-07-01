class ComicsController < ApplicationController
  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
    @authors = Author.all
    @publishers = Publisher.all

    # comic_authorをbuildする
    2.times { @comic.comic_authors.build }
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to comics_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :published_on, :price, :publisher_id, comic_authors_attributes: [:id, :comic_id, :author_id])
  end
end
