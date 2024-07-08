class ComicsController < ApplicationController
  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
    @authors = Author.all
    @publishers = Publisher.all

    # comic_authorをbuildする
    @comic.comic_authors.build
  end

  def create
    # @comic = Comic.new(comic_params.except(:comic_authors_attributes))

    # author_ids = comic_params[:comic_authors_attributes]['0'][:author_id]
    # author_ids.each do |id|
    #   @comic.comic_authors.build(author_id: id)
    # end

    @comic = Comic.new(comic_params)

    if @comic.save
      redirect_to comics_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :published_on, :price, :publisher_id, comic_authors_attributes: [author_ids: []])
  end
end
