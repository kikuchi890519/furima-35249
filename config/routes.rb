Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"

  # ルーティングのネスト
  # :items 親となるコントローラー
  # :purchase_records 子となるコントローラー
  resources :items do
    resources :purchase_records, only: [:index, :create ]
  end
end