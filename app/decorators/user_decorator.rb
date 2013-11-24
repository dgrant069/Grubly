class UserDecorator < Draper::Decorator
  delegate_all
  decorates_finders
  decorates :user
  decorates_association :photo
  decorates_association :order
  decorates_association :restaurant

  # def created_at
  #   helpers.content_tag :span, class: 'time' do
  #     object.created_at.strftime("%a %m/%d/%y")
  #   end
  # end

  # def orders_list
  #   h.content_tag(:tr) do
  #     @orders.each do |order|
  #       @restaurant = order.restaurant.id
  #       h.content_tag(:td) do
  #         site_link "Order #{order.id}", restaurant_order_path(@restaurant, order)
  #       end
  #       h.content_tag(:td) do
  #         site_link "#{order.restaurant.name}", restaurant_path(@restaurant)
  #       end
  #       h.content_tag(:td) do
  #         l order.created_at
  #       end
  #       h.content_tag(:td) do
  #         button_to "Hell yes!"
  #       end
  #     end.join
  #   end
  # end

  # def original_order
  #   site_link "Order #{order.id}", restaurant_order_path(@restaurant, order)
  # end

  # def avatar
  #   model.photos.each do |photo|
  #      h.image_tag photo.photo.url(:avatar)
  #     if policy(model).edit_photo?
  #       site_link 'Edit Avatar', edit_user_photo_path(model, photo)
  #       site_link 'Delete Avatar', user_photo_path(model, photo),
  #                                method: :delete, data: { confirm: 'Are you sure?' }
  #     end
  #   end
  #   policy(model).edit_photo? && unless model.photos.any?
  #     site_link 'New Avatar', new_user_photo_path(model)
  #   end
  # end

  def social_provider
    handle_none model.provider do
      model.provider
    end
  end

  def social_link
    handle_none model.username do
      site_link model.username, "http://#{model.provider}.com/#{model.twitter_name}"
    end
  end

  def bio
    handle_none model.bio do
      markdown(model.bio)
    end
  end

  def member_since
    model.created_at.strftime("%B %e, %Y")
  end

private

  # def user_policy_edit_photo
  #   if policy(model).edit_photo?
  #     yield
  #   else
  #     h.content_tag :span, "None given", class: "none"
  #   end
  # end

  # def user_policy_edit_photo

  # end

  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end

  def site_link(content)
    h.link_to_if model.url.present?, content, model.url
  end

  # def avatar_name
  #   if model.avatar_image_name.present?
  #     model.avatar_image_name
  #   else
  #     "default.png"
  #   end
  # end
end

