OrderPolicy = Struct.new(:user, :order) do
  def create?
    user.present?
  end

  def update?
    (user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin")
  end

  def destroy?
    (user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin")
  end

  def finalize?
    (user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin")
  end
end
