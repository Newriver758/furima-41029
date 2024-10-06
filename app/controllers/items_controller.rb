class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    # rubocop:enable Style/GuardClause
    if @item.user_id != current_user.id
      redirect_to root_path
    end
    # rubocop:enable Style/GuardClause
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id,
                                 :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
