ActiveAdmin.register VoiceType do
  controller do
    def permitted_params
      params.permit(:voice_type => [:name])
    end
  end
end
