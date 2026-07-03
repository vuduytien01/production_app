class Task < ApplicationRecord
  # Bắt buộc trường title không được để trống
  validates :title, presence: { message: "không được bỏ trống đâu nhé Tiến ơi!" }
  
  # Bắt buộc phần mô tả phải nhập ít nhất 5 ký tự
  validates :description, length: { minimum: 5, message: "phải nhập dài từ 5 ký tự trở lên." }
end