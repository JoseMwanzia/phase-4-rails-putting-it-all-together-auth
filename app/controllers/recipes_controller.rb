class RecipesController < ApplicationController

    # GET /recipes
    def index
        render json: Recipe.all, status: :created
    end

    # POST /create
    def create
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private 

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
