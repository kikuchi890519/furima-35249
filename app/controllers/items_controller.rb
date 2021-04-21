class ItemsController < ApplicationController
  # ログインユーザーのみにアクセスを許可する。
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @items = Item.all
    # # 記事一覧が新規投稿順に並ぶように記述します。
    # @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  # end

  private

  def item_params
    params.require(:item).permit(:name, :details, :category_id, :condition_id, :shipping_charge_id, :city_id, :days_ship_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
