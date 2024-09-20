class ItemsController < ApplicationController
  def index
    @items = Item.all

    def new
      @item = Item.new
    end
  
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to @item, notice: '商品が正常に出品されました。'
      else
        render :new
      end
    end
  
    private
  
    def item_params
      params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
