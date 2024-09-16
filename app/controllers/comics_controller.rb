class ComicsController < ApplicationController
  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
    set_params
  end

  def create
    @comic = Comic.new(comic_params)

    if @comic.save
      redirect_to comics_url
    else
      set_params
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comic = Comic.find(params[:id])
    set_params
  end

  def update
    Comic.create(comic_params)
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :published_on, :price, :publisher_id, comic_authors_attributes: :author_id)
  end

  def set_params
    @authors = Author.all
    @publishers = Publisher.all

    @authors.each do |author|
      @comic.comic_authors.build(author: )
    end
  end
end
