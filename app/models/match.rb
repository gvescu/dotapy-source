class Match < ActiveRecord::Base
  belongs_to :user
  has_many :match_details
  accepts_nested_attributes_for :match_details, reject_if: :all_blank, allow_destroy: true

  before_save do
  	self.match_details.each do |d|
  		if d.player_slot < 100
  			d.victory = self.radiant_win
  		else
  			d.victory = !self.radiant_win
  		end
  		d.save
  	end
  end
  
end
