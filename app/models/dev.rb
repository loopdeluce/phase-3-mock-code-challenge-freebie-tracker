require 'Pry'

class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  # accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false
  def received_one?(item_name) 
    self.freebies.any?{ |freebie| freebie.item_name == item_name}
  end

  # accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away
  def give_away(dev, freebie)
    # binding.pry
    if self.received_one?(freebie.item_name)
      freebie.update(dev: dev)
    else
      "This freebie doesn't belong to the #{self.name}"
    end
  end

end



