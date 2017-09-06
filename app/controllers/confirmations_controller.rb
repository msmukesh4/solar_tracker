class ConfirmationsController < Devise::ConfirmationsController
    
    def new
        super
    end

    def create
        super
    end

    def show
        Rails.logger.info("--------------------------------------")
        self.resource = resource_class.confirm_by_token(params[:confirmation_token])

        if resource.errors.empty?
            set_flash_message(:notice, :confirmed) if is_navigational_format?
            sign_in(resource_name, resource)
            Rails.logger.info("user id : "+resource.id.to_s)

            respond_with_navigational(resource){ redirect_to after_sign_in_path_for(resource) }
        else
            respond_with_navigational(resource.errors, :status => :unprocessable_entity){ root_path }
        end

        Rails.logger.info("--------------------------------------")
    end
end