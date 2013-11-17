RestaurantPolicy = Struct.new(:user, :restaurant) do
  def create?
    user.present? && ((user.role == "admin") || (user.role == "owner"))
  end

  def item_create?
    user.present? && ((user.role == "admin") || (restaurant.owner == user.id))
  end

  def edit?
    user.present? && ((user.role == "admin") || (restaurant.owner == user.id))
  end

  def update?
    user.present? && ((user.role == "admin") || (restaurant.owner == user.id))
  end

  def destroy?
    user.present? && ((user.role == "admin") || (restaurant.owner == user.id))
  end

  def order_filled?
    user.present? && ((user.role == "admin") || (restaurant.owner == user.id))
  end
end
