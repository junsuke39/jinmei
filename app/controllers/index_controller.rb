class IndexController < ApplicationController
  layout false, only: :search

  def index
  end

  def search
    if params[:text].present?
      @dicts = Dict.where("kanji LIKE :text OR hiragana LIKE :text", text: "#{params[:text]}%").limit(50)
    end
  end
end
