class Port < ApplicationRecord
  has_many :ships

  def self.sorted_recent_at_top
    return Port.order(created_at: :desc)
  end
end
