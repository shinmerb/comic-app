class ComicsController < ApplicationController
  before_action :set_params, only: %i[new edit]
  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def show
    @comic = Comic.find(params[:id])
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
  end

  def update
    @comic = Comic.find(params[:id])

    if @comic.update(comic_params)
      redirect_to comics_url, notice: '漫画を更新しました'
    else
      set_params
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :published_on, :price, :publisher_id, author_ids: [])
  end

  def set_params
    @authors = Author.all
    @publishers = Publisher.all
  end
end
