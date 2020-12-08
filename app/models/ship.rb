class Ship < ApplicationRecord
  belongs_to :port

  def self.sorted_recent_at_top
    return order(created_at: :desc)
  end
end
