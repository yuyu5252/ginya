class FoodsController < ApplicationController
    # 💡 edit, update, destroy にも事前にBASIC認証（パスワード）をかける！
    before_action :admin_authenticate, only: [:new, :create, :edit, :update, :destroy]
    
    # 💡 何度も使う「1件のデータを特定する処理」を共通化する
    before_action :set_food, only: [:show, :edit, :update, :destroy]
    
    def index
        @food = Food.all.order(created_at: :desc)
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

  # 💡 共通化：URLの id からデータを1件見つけるお守り
  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:date, :title, :image, :about)
  end

  # 💡 BASIC認証の仕組み
  def admin_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      # ユーザー名とパスワードを好きな文字に決めてください
      username == "ginya_master" && password == "himitsu777"
    end
  end


end
