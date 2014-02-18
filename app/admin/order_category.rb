ActiveAdmin.register OrderCategory do
  controller do
    def permitted_params
      params.permit(:order_category => [:name, :role_name])
    end
  end
end
