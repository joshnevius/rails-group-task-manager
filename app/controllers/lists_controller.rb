class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all
    # render 'lists/index.html.erb'
  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.build
  end

  def create
    @list = List.new(list_params)
    @list.name = params[:list][:name]
    @list.save

    redirect_to list_url(@list)
  end
  private

    def list_params # strong parameters
      params.require(:list).permit(:name)
    end
end
