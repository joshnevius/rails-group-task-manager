class ListsController < ApplicationController
  #before_action :require_login

  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
  end

  def new 
    @list = List.new
    @list.tasks.build
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @task = Task.find_by(params[:id])
    @task.destroy
    redirect_to @list
  end

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:name, :status])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id    
  end
end
