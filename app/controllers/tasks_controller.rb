class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy ]
  before_action :correct_user, only: [:edit, :update,:destroy,:show]


  def index
    @tasks = Task.all
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
    if @task.save
    flash[:notice]="Task created successfully "
    redirect_to root_path
    else
    flash[:notice]="An error occured while creating new task"
    redirect_to root_path
    end
  end


  def update
    if @task.update(task_params)
    flash[:notice]="Task updated successfully "
    redirect_to tasks_path
    else
    flash[:notice]="An error occured while updating task"
    redirect_to root_path
    end
  end


  def destroy
      @task.destroy
      redirect_to root_path
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    redirect_to root_path, notice: "Not autherised to do this action" if @task.nil?
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end


    def task_params
      params.require(:task).permit(:name, :description, :duedate, :user_id)
    end
end
