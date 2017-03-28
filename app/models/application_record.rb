class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    def display_error_message
      errors.full_messages.join('. ') << '.' if errors.any?
    end
end
