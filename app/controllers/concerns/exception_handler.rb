module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotUnique do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::InvalidForeignKey do |e|
      json_response({ message: 'There is an application related to this job post, you cannot delete it' }, :unprocessable_entity)
    end

    rescue_from Pundit::NotAuthorizedError do |e|
      json_response({ message: 'Access Denied' }, :unprocessable_entity)
    end

    # rescue_from NoMethodError do |e|
    #   json_response({ message: 'Something Went Wrong' }, 500)
    # end
  end
end
