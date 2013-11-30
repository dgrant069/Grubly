class OrderMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']

  def order_sent(restaurant, order)
    @restaurant = restaurant
    @order = order

    mail to: User.find(@restaurant.owner).email, subject: "New order placed at #{@restaurant.name}"
  end

  def send_receipt(order)
    @order = order
    @restaurant = Restaurant.find(@order.restaurant)
    @user = User.find(@order.user_id)

    mail to: @user.email, subject: "Here's your receipt!"
  end
end
