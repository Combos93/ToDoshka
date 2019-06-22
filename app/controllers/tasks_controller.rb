class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :complete, :destroy]

  def index
    @tasks = Task.where(completed: false).order('created_at DESC')
    @completed_tasks = Task.where(completed: true).order('updated_at')
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Your task created successfully!'
    else
      render :edit
    end
  end

  def edit
  end

  def update
    @task.update_attributes(task_params)

    redirect_to tasks_path
  end

  def complete
    @task.complete!

    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  def find_task
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit([
      :user_id, :title, :priority, :completed, :deadline
    ])
  end
end
