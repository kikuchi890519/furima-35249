Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # 【メモ書き】
  # ルーティングのネスト
  # :items 親となるコントローラー
  # :purchase_records 子となるコントローラー
  resources :items do
    resources :purchase_records, only: [:index, :create ]
  end
end