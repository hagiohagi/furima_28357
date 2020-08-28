class Order < ApplicationRecord
<<<<<<< Updated upstream

belongs_to :user
belongs_to :item
has_one :address

=======
  belongs_to :user
  belongs_to :item
  has_one :address, dependent: :destroy
>>>>>>> Stashed changes
end
