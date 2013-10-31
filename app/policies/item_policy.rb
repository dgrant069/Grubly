PostPolicy = Struct.new(:user, :item) do
  def create?
    user.role == admin? || (user.role == "owner" && item.restaurant.owner == user.id)
  end

  def update?

  end

  def destroy?

  end
end
