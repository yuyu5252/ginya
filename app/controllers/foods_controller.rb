class FoodsController < ApplicationController

    def index
        @foods = Food.all.order(created_at: :desc)
    end

    def about
    end

    def show
        @food = Food.find(params[:id])
    end

    def news_list
        @foods = Food.all.order(created_at: :desc)
    end

    def dishes_list
        @dishes = Food.all.order(created_at: :desc) 
    end

    def new
        @food = Food.new
    end

    def create
        food = Food.new(food_params)
        if food.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
    @food = Food.find(params[:id])
    end

    def edit
    @food = Food.find(params[:id])
    end


    def update
        food = Food.find(params[:id])
        if food.update(food_params)
            redirect_to :action => "show", :id => food.id
        else
            redirect_to :action => "new"
        end

    end

    def destroy
        food = Food.find(params[:id])
        food.destroy
        redirect_to action: :index
    end

  private
  def food_params
    params.require(:food).permit(:date, :title, :image, :about)
  end


end
