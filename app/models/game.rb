class Game < ApplicationRecord

    validates :owner_id, numericality: true

    validates :name, presence: true
    
    validates :name, presence: true

    validates :description, presence: true

    validates :genre, presence: true

    validates :platform, presence: true

    validates :rent_rate, numericality: {only_integers: true}

    validates :max_rent_duration, numericality: {only_integers: true}

    validates :status, presence: true
    validate :status_checker

    def status_checker
		  if status != 'available' && status != 'unavailable'
			  errors.add(:status, "Invalid input") 
		  end
	  end
end
