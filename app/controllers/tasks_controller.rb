class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @title = params[:title].present? && params[:title].length >0 ? params[:title] : '';
    @status = params[:status].present? && params[:status].length >0 ? params[:status] : '';
    puts status
    @tasks = Task.order_by(params[:column]||"created_at", params[:order]||"DESC")
    .filter_task(@title, @status)
    .page params[:page]||1
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      redirect_to @task, success: 'view.task_created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, success: 'view.task_updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url(column: 'created_at', order: 'desc'), success: 'view.task_destroyed'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :content, :expired_at, :status, :priority)
    end
end
