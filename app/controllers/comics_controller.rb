class ComicsController < ApplicationController
  def index
    @comics = Comic.includes(:publisher, :authors)
  end

  def new
    @comic = Comic.new
    @authors = Author.all
    @publishers = Publisher.all

    @authors.each do |author|
      @comic.comic_authors.build(author:)
    end
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
    params.require(:comic).permit(:name, :published_on, :price, :publisher_id, comic_authors_attributes: :author_id)
  end
end
