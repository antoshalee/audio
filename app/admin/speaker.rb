ActiveAdmin.register Speaker do
  controller do
    def permitted_params

      params.permit(:speaker => [:user_id, :account_number, :timbre_level, :voice_kind, voice_type_ids: []])
    end
  end

  form do |f|
    f.inputs do
      f.input :sex, as: :select
      f.input :user
      f.input :account_number
      f.input :timbre_level
      f.input :voice_types
    end
    f.buttons
  end
end
