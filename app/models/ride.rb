class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates :user_id, presence: true
  validates :attraction_id, presence: true

  def take_ride

    height_message = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    ticket_message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."

    def height_test
      self.user.height < self.attraction.min_height
    end

    def ticket_test
      self.user.tickets < self.attraction.tickets
    end

    def to_zero(x)
      if x < 0
        0
      else
        x
      end
    end

    if height_test && ticket_test
      return ticket_message + " You are not tall enough to ride the #{self.attraction.name}."
    elsif height_test
      return height_message
    elsif ticket_test
      return ticket_message
    else
    end


    self.user.tickets -= self.attraction.tickets

    # self.user.tickets = to_zero(self.user.tickets)
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness +=  self.attraction.happiness_rating
    self.user.save
    return "Thanks for riding the #{self.attraction.name}!"
  end

end
