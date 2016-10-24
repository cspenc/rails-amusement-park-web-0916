class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
      meet_tickets = enough_tickets?
      meet_height = tall_enough?

      if meet_tickets && meet_height
        start_ride
      elsif meet_height && !meet_tickets
        "Sorry. " + ticket_issue
      elsif meet_tickets && !meet_height
        "Sorry. " + height_issue
      else
        "Sorry. " + ticket_issue + " " + height_issue
      end
  end

  def enough_tickets?
    enough_tickets = false
    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end
    return enough_tickets
  end

  def tall_enough?
    tall_enough = false
    if self.user.height >= self.attraction.min_height
      tall_enough = true
    end
    return tall_enough
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets
    self.user.update(
        :happiness => new_happiness,
        :nausea => new_nausea,
        :tickets => new_tickets
    )
  end

  def ticket_issue
    "You do not have enough tickets the #{self.attraction.name}."
  end

  def height_issue
    "You are not tall enough to ride the #{self.attraction.name}."
  end
end
