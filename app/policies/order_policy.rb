OrderPolicy = Struct.new(:user, :order) do
  def show?
    (user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin")
  end

  def create?
    user.present?
  end

  def update?
    (user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin")
  end

  def destroy?
    (user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin")
  end

  def edit_after_final?
    (order.restaurant.owner == user.id) || (user.role == "admin")
  end

  def finalize?
    (user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin")
  end
end
