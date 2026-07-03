Rails.application.routes.draw do
  # Quản lý toàn bộ các đường dẫn CRUD cho Task
  resources :tasks

  # Định tuyến gốc (Trang chủ): Vào localhost:3000 là tự nhảy vào trang danh sách task
  root "tasks#index"

  # Đường dẫn kiểm tra trạng thái hệ thống mặc định
  get "up" => "rails/health#show", as: :rails_health_check
end