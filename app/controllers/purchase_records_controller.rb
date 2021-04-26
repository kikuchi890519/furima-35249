class PurchaseRecordsController < ApplicationController
# ログインユーザーのみにアクセスを許可する。
before_action :authenticate_user!, only: [:index]

def index
  @form = Form.new
  @item = Item.find(params[:item_id])
  if @item.purchase_record.present? || current_user.id == @item.user_id 
  redirect_to root_path 
  # @item = @form.item_id
  end
end

# 
# redirect_to root_path unless @item.user_id == current_user.id
# end

def create
  @form = Form.new(form_params)
  @item = Item.find(params[:item_id])
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

def set_form
  @form = Form.find(params[:id])
end

private
# paramsはできるだけ1つにまとめてあげる
# String Parameter：require（データのオブジェクト名）、permit（保存の処理ができるカラム名）、merge（カラム名：追加したいデータ値）
  def form_params
    params.require(:form).permit(:post_code, :city_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  # "sk_test_53554cd1606bd25abbf1bc64"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: form_params[:token],    # カードトークン
    currency: 'jpy'               # 通貨の種類（日本円）
  )
 end
end