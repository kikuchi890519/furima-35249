class ItemsController < ApplicationController
  # ログインユーザーのみにアクセスを許可する。
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
    # 記事一覧が新規投稿順に並ぶように記述します。
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
    if @item.purchase_record.present? 
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :details, :category_id, :condition_id, :shipping_charge_id, :city_id, :days_ship_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  private
  def redirect_root
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
