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
  
  private
  
  def item_params
    params.require(:item).permit(:name, :status)
  end
end
