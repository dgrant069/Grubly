PostPolicy = Struct.new(:user, :restaurant) do
  def create?
    user.role == admin? || (user.role == "owner" && restaurant.owner == user.id)
  end

  def update?

  end

  def destroy?

  end
end
