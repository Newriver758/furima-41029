class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_ordered, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_ordered
    redirect_to root_path if @item.order.present?
  end
end
