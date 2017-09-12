class Sheet < ApplicationRecord

  validates :pol, :pod, :rate_wm, :rate_min, :tt, presence: true
end
