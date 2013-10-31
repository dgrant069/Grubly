ItemPolicy = Struct.new(:user, :item) do
  def create?
    (user.role == "admin") || (item.restaurant.owner == user.id)
  end

  def update?
    (user.role == "admin") || (item.restaurant.owner == user.id)
  end

  def destroy?
    (user.role == "admin") || (item.restaurant.owner == user.id)
  end
end
