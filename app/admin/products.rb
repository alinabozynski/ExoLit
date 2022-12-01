ActiveAdmin.register Product do
  permit_params :name, :details, :price, :on_sale, :new, :category_id, :image

  # Formtastic
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file
    end
    f.actions         # adds the 'Submit' and 'Cancel' button
  end
end
