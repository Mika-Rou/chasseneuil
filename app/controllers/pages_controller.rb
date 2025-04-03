class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def booking
  end

  def property
  end

  # app/controllers/pages_controller.rb
# [...]
  def article_params
    params.require(:property).permit(:title, :body, :photo)
  end
end
