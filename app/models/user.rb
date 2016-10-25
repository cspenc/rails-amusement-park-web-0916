class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true
  validates :admin, presence: false

  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
        if mood > 0
         return "happy"
       else
         return "sad"
       end
     end
  end
end
