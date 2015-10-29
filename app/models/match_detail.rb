class MatchDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :dota_hero
  belongs_to :match

  def self.roles
  	[
  		'none', 'carry', 'support', 'mid', 'offlane'
  	]
  end
end
