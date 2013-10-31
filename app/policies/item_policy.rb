ItemPolicy = Struct.new(:user, :item) do
  def create?
    user.present? && ((user.role == "admin") || (item.restaurant.owner == user.id))
  end

  def edit?
    user.present? && ((user.role == "admin") || (item.restaurant.owner == user.id))
  end

  def update?
    user.present? && ((user.role == "admin") || (item.restaurant.owner == user.id))
  end

  def destroy?
    user.present? && ((user.role == "admin") || (item.restaurant.owner == user.id))
  end
end
