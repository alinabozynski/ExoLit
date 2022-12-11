ActiveAdmin.register Order do
  permit_params :status

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: (["Pending", "Paid", "Shipped"])
    end
    f.actions
  end
end
