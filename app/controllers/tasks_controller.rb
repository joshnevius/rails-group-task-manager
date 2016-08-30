class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
    if @task.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to list_path(@task.list)
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :status)
  end
end
