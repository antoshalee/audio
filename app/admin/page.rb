ActiveAdmin.register Page do
  controller do
    def permitted_params
      params.permit!
    end
  end

  config.clear_sidebar_sections!

  index do
    column :name
    column :slug
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :slug
      f.input :text, as: :html_editor
    end

    f.buttons
  end

  show do |item|
    attributes_table do
      row :name
      row :slug
      row :text do |page|
        raw page.text
      end
    end
  end

end
