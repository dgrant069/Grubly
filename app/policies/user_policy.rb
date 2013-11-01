UserPolicy = Struct.new(:user, :record) do
  def index?
    user.present? && user.role == "admin"
  end

  def edit?
    user.present? && user.role == "admin"
  end

  def update?
    user.present? && user.role == "admin"
  end

  def destroy?
    user.present? && user.role == "admin"
  end

end
