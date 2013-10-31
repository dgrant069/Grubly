PostPolicy = Struct.new(:user, :order) do
  def create?
    user.present?
  end

  def update?

  end

  def destroy?

  end

  def finalize?

  end
end
