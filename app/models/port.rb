class Port < ApplicationRecord
  has_many :ships

  def self.ports_sorted_recent_at_top
    return Port.order(created_at: :desc)
  end
end
