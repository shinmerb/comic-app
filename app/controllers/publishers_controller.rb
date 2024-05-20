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
      redirect_to @publisher, notice: '出版社を保存しました'
    else
      render :new
    end
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name, :address)
  end
end
