class ApplicationController < ActionController::Base
  def current_admin?
    current_user && current_user.admin?
  end

private
      def error_message(errors)
        errors.full_messages.join(', ')
      end
end
