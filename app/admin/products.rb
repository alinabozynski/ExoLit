ActiveAdmin.register Product do
  permit_params :name, :details, :price, :on_sale, :new, :category_id, :image, :delete_image

  # Formtastic
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute

    if f.object.image.attached?
      f.inputs do
        f.input :image, as: :file, :hint => image_tag(f.object.image, size: "300x300")
      end
    else
      f.inputs do
        f.input :image, as: :file
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' button
  end
end
