class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @items = Item.all.order(created_at: :desc)
    #スマートではないが動く
    @lang_hash = {
                  "git" => "Git", "ruby" => "Ruby", "rails" => "Rails",
                  "aws" => "AWS", "php" => "PHP",
                  "info" => "情報発信", "writing" => "ライティング講座",
    }
    @exp_categ_hash = {
                  "finding" => "気付き",
                  "question" => "疑問",
                  "solution" => "解決",
    }
  end

  def new
    @item = Item.new

    @article = {
                body: "# 見出し"
    }

  end

  def create
    @item = Item.new(language: item_params[:language], keyword: item_params[:keyword], exp_category: item_params[:exp_category], exp_detail: item_params[:exp_detail], body: item_params[:body], user_id: current_user.id)
    @item.save

    if @item.save
      flash[:notice] = "＜＜投稿完了"
      redirect_to(items_path)
    else
      render("items/new")
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:notice] = "＜＜削除完了"
    redirect_to(items_path)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      flash[:notice] = "＜＜編集完了"
      redirect_to(items_path)
    else
      render("items/edit")
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

#＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝以下プラベート＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
  private

  def item_params
    params.require(:item).permit(:language, :keyword, :exp_category, :exp_detail, :body)
  end

end
