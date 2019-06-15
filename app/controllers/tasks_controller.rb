class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :complete, :destroy]

  def index
    @tasks = Task.where(completed: false).order('priority DESC')
    @completed_tasks = Task.where(completed: true).order('updated_at')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    @task.save

    redirect_to tasks_path
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
      :title, :priority, :completed
    ])
  end
end
