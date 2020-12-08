class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sorted_recent_at_top
    return order(created_at: :desc)
  end
end
