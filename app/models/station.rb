class Station < ApplicationRecord
  validates :host_id, uniqueness: true

end
