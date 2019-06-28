class TodolistsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  before_action :set_todolist, only: [:show]
  before_action :set_current_user_todolist, only: [:edit, :update, :destroy]

  # GET /todolists
  def index
    @todolists = Todolist.all
  end

  # GET /todolists/1
  def show
    @tasks = @todolist.tasks.where(completed: false).order('created_at DESC')
    @completed_tasks = @todolist.tasks.where(completed: true).order('updated_at')
  end

  # GET /todolists/new
  def new
    @todolist = current_user.todolists.build
  end

  # GET /todolists/1/edit
  def edit
  end

  # POST /todolists
  def create
    @todolist = current_user.todolists.build(todolist_params)

    if @todolist.save
      redirect_to root_path, notice: 'Список дел был успешно создан'
    else
      render :new
    end
  end

  # PATCH/PUT /todolists/1
  def update
    if @todolist.update(todolist_params)
      redirect_to root_path, notice: 'Список дел был успешно обновлён'
    else
      render :edit
    end
  end

  # DELETE /todolists/1
  def destroy
    @todolist.destroy
    redirect_to todolists_url, notice: 'Список дел был успешно удалён'
  end

  def complete
    @task.complete!

    redirect_to todolist_task_path
  end

  private

  def set_todolist
    @todolist = Todolist.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
  
  def set_current_user_todolist
    @todolist = current_user.todolists.find(params[:id])
  end

  def todolist_params
    params.fetch(:todolist, {}).permit([:title, :description, :pincode, :user_id])
  end
end
