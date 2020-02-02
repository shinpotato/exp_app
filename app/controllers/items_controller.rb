class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(language: item_params[:language], keyword: item_params[:keyword], exp_category: item_params[:exp_category], exp_detail: item_params[:exp_detail], user_id: current_user.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

#＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝以下プラベート＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
  private

  def item_params
    params.require(:item).permit(:language, :keyword, :exp_category, :exp_detail)
  end

end
