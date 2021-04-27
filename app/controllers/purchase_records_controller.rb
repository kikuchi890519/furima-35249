class PurchaseRecordsController < ApplicationController
# 【メモ書き】authenticate_user!でログインユーザーのみにアクセスを許可する
before_action :authenticate_user!, only: [:index, :create]
before_action :set_item, only: [:index, :create]
before_action :redirect_to, only: [:index, :create]

def index
  @form = Form.new
end

def create
  @form = Form.new(form_params)
  # 【メモ書き】
  # formオブジェクトはモデルのようでモデルではない
  # valid?を使って@formのバリデーションをチェックする必要あり
  # 通常のモデルではsaveにバリデーションチェックと保存の機能あり
  if @form.valid?
     pay_item
     @form.save
     redirect_to root_path
  else
     render :index
  end
end

def set_item
  @item = Item.find(params[:item_id])
end

def redirect_to
  if @item.purchase_record.present? || current_user.id == @item.user_id 
     redirect_to root_path 
  end
end

private
# 【メモ書き】
# paramsはできるだけ1つにまとめてあげる
# String Parameter：require（データのオブジェクト名）、permit（保存の処理ができるカラム名）、merge（カラム名：追加したいデータ値）
def form_params
  params.require(:form).permit(:post_code, :city_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: form_params[:token],    # カードトークン
    currency: 'jpy'               # 通貨の種類（日本円）
  )
 end
end