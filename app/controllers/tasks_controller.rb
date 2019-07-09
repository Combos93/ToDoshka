class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  #before_action :set_todolist, only: [:new, :create, :edit, :destroy]
  #before_action :set_task, except: [:new, :create, :destroy]

  def index
    @todolist = Todolist.find(params[:todolist_id])
    @task = @todolist.tasks.find(params[:id])

    @tasks = @todolist.tasks.where(completed: false).order('created_at ASC')
    @completed_tasks = @todolist.tasks.where(completed: true).order('updated_at')
  end

  def new
    @todolist = Todolist.find(params[:todolist_id])

    @task = Task.new
  end

  def create
    @todolist = Todolist.find(params[:todolist_id])

    @task = @todolist.tasks.build(task_params)
    @task.user = current_user

    if @task.save
      redirect_to @todolist, notice: 'Your task created successfully!'
    else
      render :new
    end
  end

  def edit
    @todolist = Todolist.find(params[:todolist_id])
    @task = @todolist.tasks.find(params[:id])
  end

  def show
    @todolist = Todolist.find(params[:todolist_id])

    @tasks = @todolist.tasks.where(completed: false).order('created_at DESC')
    @completed_tasks = @todolist.tasks.where(completed: true).order('updated_at')
  end

  def update
    @todolist = Todolist.find(params[:todolist_id])
    @task = @todolist.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to @todolist 
    else
      render :edit
    end
  end

  def complete
    @todolist = Todolist.find(params[:todolist_id])
    @task = @todolist.tasks.find(params[:id])

    @task.complete!

    redirect_to @todolist
  end

  def destroy
    @todolist = Todolist.find(params[:todolist_id])
    @task = @todolist.tasks.find(params[:id])

    if @task.destroy
      redirect_to @todolist
    end
  end

  private

  def set_todolist
    @todolist = Todolist.find(params[:todolist_id])
  end

  def set_task
    @task = @todolist.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit([
      :todolist_id, :user_id, :description,
      :title, :priority, :completed, :deadline
    ])
  end
end
