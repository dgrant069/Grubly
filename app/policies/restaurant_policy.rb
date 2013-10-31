RestaurantPolicy = Struct.new(:user, :restaurant) do
  def create?
    (user.role == "admin") || (user.role == "owner")
  end

  def item_create?
    (user.role == "admin") || (restaurant.owner == user.id)
  end

  def update?
    (user.role == "admin") || (restaurant.owner == user.id)
  end

  def destroy?
    (user.role == "admin") || (restaurant.owner == user.id)
  end
end
