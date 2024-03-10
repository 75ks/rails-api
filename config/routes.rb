Rails.application.routes.draw do
  # psales_dateが1994年9月以降のレコードを返す新しいAPIエンドポイント
  get 'packedsales/after_september_1994', to: 'packedsales#after_september_1994'
  # 税抜売上合計金額を返す新しいAPIエンドポイント
  get 'packedsales/net_totals', to: 'packedsales#net_totals'
  # 売上に紐づく従業員情報を返す新しいAPIエンドポイント
  get 'packedsales/:psales_no/employee', to: 'packedsales#employee'

  resources :customers, only: [:index, :create]
  resources :departments, only: :index
  resources :employees, only: :index
  resources :packedsales, only: [:index, :show]
  resources :products, only: :index
  resources :sales, only: :index
end
