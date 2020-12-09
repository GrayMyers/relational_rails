class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.recent_at_top
    return order(created_at: :desc)
  end
end
