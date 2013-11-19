module ApplicationHelper
  def associated_fields(f, association, new_object)
    f.fields_for(association, new_object, child_index: new_object.object_id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    fields = associated_fields(f, association, new_object)
    link_to(name, '#', class: "add_fields", data: {id: new_object.object_id, fields: fields.gsub("\n", "")})
  end
end
