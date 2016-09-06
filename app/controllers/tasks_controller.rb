class TasksController < ApplicationController
  
  def index
    @task = Task.all
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
    @task.save
    redirect_to @list
  end
  
  def edit
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to list_path(@task.list)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_path(@task.list)
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :status)
  end
end
