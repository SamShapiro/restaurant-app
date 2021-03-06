class RestaurantsController < ApplicationController
	
	before_action :set_restaurant, only: [:show]
	before_action :set_restaurant_with_user, only: [:edit, :update, :destroy]
	before_action :update_restaurant_from_params, only: [:update]
	before_filter :authenticate_user!, except: [:index, :show]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def show
	end

	def edit
	end

	def create
		@restaurant = current_user.restaurants.build(restaurant_params)
		respond_to do |format|
			if @restaurant.save
				format.html {redirect_to @restaurant, notice: 'Restaurant was succesfully created.'}
				format.json {render :show, status: :created, location: @restaurant}
			else
				format.html {render :new}
				format.json {render json: @restaurant.errors, status: :unprocessable_entity}
			end
		end
	end

	def update
		respond_to do |format|
			if @restaurant.save
				format.html {redirect_to @restaurant, notice: 'Restaurant was succesfully updated.'}
				format.json {render :show, status: :ok, location: @restaurant}
			else
				format.html {render :edit}
				format.json {render json: @restaurant.errors, status: :unprocessable_entity}
			end
		end
	end

	def destroy
		@restaurant.destroy
		respond_to do |format|
			format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
			format.json {head :no_content}
		end
	end

	private 
		def set_restaurant
			@restaurant = Restaurant.find(params[:id])
		end
		
		def set_restaurant_with_user
			@restaurant = current_user.restaurants.find(params[:id])
		end
		
		def update_restaurant_from_params
			@restaurant.update(restaurant_params)	
		end

		def restaurant_params
			params.require(:restaurant).permit(:id, :name, :address, :description, :city, :state, :zipcode, :phone, { category_ids: [] })
		end
end
