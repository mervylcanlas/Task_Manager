class CategoriesController < ApplicationController
    def index
        @category = Category.where(user_id: current_user.id)
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params.merge(user_id: current_user.id))
    
        if @category.save
          redirect_to @category
        else
          render :new
        end
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
    
        if @category.update(category_params.merge(user_id: current_user.id))
          redirect_to @category
        else
          render :edit
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
    
        redirect_to root_path
    end


    private
    def category_params
      params.require(:category).permit(:title, :details)
    end
end
