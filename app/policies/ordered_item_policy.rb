PostPolicy = Struct.new(:user, :ordered_item) do
  def create?
    user.present?
  end

  def update?

  end

  def destroy?

  end
end
