module V1
  class MtvController < ActionController::API
    def index
      render json: news_items_collection
    end

    private

    def news_items_collection
      MtvItem.where("(title) ILIKE '%#{params[:query]}%'")
    end
  end
end
