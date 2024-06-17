class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path, notice: '著者を保存しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to authors_path, notice: '著者を更新しました'
    else
      render :edit
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy!
    redirect_to authors_path, status: :see_other, notice: '著者を削除しました'
  end

  private

  def author_params
    params.require(:author).permit(:name, :birthday)
  end
end
