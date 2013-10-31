RestaurantPolicy = Struct.new(:user, :restaurant) do
  def create?
    user.present? && (user.role == "admin") || (user.role == "owner")
  end

  def item_create?
    user.present? && (user.role == "admin") || (restaurant.owner == user)
  end

  def edit?
    user.present? && (user.role == "admin") || (restaurant.owner == user)
  end

  def update?
    user.present? && (user.role == "admin") || (restaurant.owner == user)
  end

  def destroy?
    user.present? && (user.role == "admin") || (restaurant.owner == user)
  end
end
