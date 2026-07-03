class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    # Chỉ lấy ra các task thuộc về User đang đăng nhập
    @tasks = Current.user.tasks
  end

  def new
    @task = Current.user.tasks.new
  end

  def create
    # Tạo task mới gắn chặt với ID của User đang đăng nhập
    @task = Current.user.tasks.new(task_params)

    if @task.save
      redirect_to root_path, notice: "Tạo task thành công!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "Cập nhật thành công!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: "Đã xóa task!"
  end

  private
    def set_task
      # Bảo mật: Không cho phép sửa/xóa bậy task của người khác bằng cách hack ID trên URL
      @task = Current.user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :completed)
    end
end