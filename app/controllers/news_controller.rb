class NewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @news = News.all
    respond_with(@news)
  end

  def show
    respond_with(@news)
  end

  def new
    @news = News.new
    respond_with(@news)
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.user = current_user
    @news.save
    respond_with(@news)
  end

  def update
    @news.update(news_params)
    respond_with(@news)
  end

  def destroy
    @news.destroy
    respond_with(@news)
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :content, :url)
  end
end
