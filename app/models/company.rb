class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies


  # takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev
  def give_freebie(dev:, item_name:, value:)
    self.freebies << Freebie.new(item_name: item_name, value: value, dev: dev)
  end

  # returns the Company instance with the earliest founding year
  def self.oldest_company
    Company.all.order(founding_year: :asc).first
  end
end



 