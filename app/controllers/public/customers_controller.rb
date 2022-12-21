class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :guest_check
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @rooms = @customer.rooms.all
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def guest_check
    if current_customer == Customer.find(1)
      redirect_to root_path,notice: "このページを見るには会員登録が必要です。"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password)
  end
end
