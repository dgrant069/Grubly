UserPolicy = Struct.new(:user, :record) do
  def index?
    user.present? && user.role == "admin"
  end

  def show?
    user.present? && (user.role == "admin" || user.id == record.id)
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
