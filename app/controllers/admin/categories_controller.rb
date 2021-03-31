class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
  password: ENV["HTTP_BASIC_PASSWORD"]

  def index
    @categories = categories.order(id: :desc).all
  end

  def new
  end

  def create
  end
end
