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

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id    
  end
end
