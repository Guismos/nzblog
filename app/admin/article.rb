ActiveAdmin.register Article do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :title, :body, :latitude, :longitude, :picture, :description

form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs do
    f.input :title
    f.input :latitude
    f.input :longitude
    f.input :picture, as: :file
    f.input :description
    f.input :body, :as => :ckeditor
  end
  f.actions
end

show do |ad|
  attributes_table do
    row :title
    row :latitude
    row :longitude
    row :name
    row :picture do
      image_tag(ad.picture.url(:thumb))
    end
   row :description
    row (:body)  { |article| raw(article.body) }
    # Will display the image on show object page
  end
 end


end
