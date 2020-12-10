class Ship < ApplicationRecord
  belongs_to :port

  def self.floating_at_top
    return where(floating: :true) + where(floating: :false)
  end
end
