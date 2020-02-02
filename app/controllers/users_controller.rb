class UsersController < ApplicationController

  def show
#    @items = Item.where(user_id: current_user.id)
    @user = User.find(current_user.id)
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
end
