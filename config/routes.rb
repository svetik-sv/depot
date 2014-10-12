Depot::Application.routes.draw do
  get 'faq' => 'static_pages#faq'
  get 'news' => "static_pages#news"
  get 'contact' => "static_pages#contact"
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

#  scope '(:locale)' do
    resources :users
    resources :orders
    resources :carts
    resources :products do
      get :who_bought, on: :member
    end
    resources :line_items do
      put 'decrement', on: :member
    end
    root to: 'store#index', as: 'store'
#  end
end
