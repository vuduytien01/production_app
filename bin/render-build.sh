#!/usr/bin/env bash
# Tự động dừng script nếu có dòng lệnh nào bị lỗi
set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean

# Tạo thư mục lưu trữ trên đĩa cứng độc lập và liên kết nó với thư mục storage của Rails
mkdir -p /data/storage
ln -sfn /data/storage ./storage

bin/rails db:migrate