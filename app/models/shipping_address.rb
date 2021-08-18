class ShippingAddress < ApplicationRecord

  def full_address
    self.postal_code + self.address + self.name
  end
end
