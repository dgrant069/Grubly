ItemPolicy = Struct.new(:user, :item) do
  def create?
    user.present? && (user.role == "admin") || (item.restaurant.owner == user)
  end

  def edit?
    user.present? && (user.role == "admin") || (item.restaurant.owner == user)
  end

  def update?
    user.present? && (user.role == "admin") || (item.restaurant.owner == user)
  end

  def destroy?
    user.present? && (user.role == "admin") || (item.restaurant.owner == user)
  end
end
