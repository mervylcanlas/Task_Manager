class TasksController < ApplicationController
    
    def create
        @category = Category.find(params[:category_id])
        @task = @category.tasks.create(task_params.merge(user_id: current_user.id))
        redirect_to category_path(@category)
    end

    def edit
        @category = Category.find(params[:category_id])
        @task = Task.find(params[:id])
    end

    def update
        @category = Category.find(params[:category_id])
        @task = @category.tasks.find(params[:id]).update(task_params.merge(user_id: current_user.id))
        redirect_to category_path(@category)
    end

    def destroy
        @category = Category.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_path(@category)
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :deadline)
    end
end
