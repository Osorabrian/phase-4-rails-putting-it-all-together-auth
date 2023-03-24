class RecipesController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :record_is_invalid

    before_action :authorize

    def index
        recipe = Recipe.all
        render json: recipe, status: :created
    end

    def create
        user = User.find(session[:user_id])
        recipe = user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

    def record_is_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
