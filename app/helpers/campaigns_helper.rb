module CampaignsHelper
  def link_to_add_fields(f, association)
    new_object = f.object.goods.build
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to("+", '', onclick: "add_fields(this, '#{association}', \"#{escape_javascript(fields)}\"); return false;", class: "button success")
  end
end
