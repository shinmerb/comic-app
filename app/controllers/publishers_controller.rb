class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to publishers_path, notice: '出版社を保存しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])

    if @publisher.update(publisher_params)
      redirect_to publishers_path, notice: '出版社を更新しました'
    else
      render :edit
    end
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy!
    redirect_to publishers_path, notice: '出版社を削除しました'
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name, :address)
  end
end
