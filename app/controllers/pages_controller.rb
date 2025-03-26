# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def home
  end
  def about
  end

  def contact
    @members = %w[valentin milan edouard mika]

    if params[:member]
      @members = @members.select { |member| member.start_with?(params[:member]) }
    end
  end
end
