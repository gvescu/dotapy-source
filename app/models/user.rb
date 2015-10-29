class User < ActiveRecord::Base

	has_many :articles
	has_many :matches
	has_many :match_details
	has_one :ranking
	has_one :carry_ranking
	has_one :support_ranking
	has_one :mid_ranking
	has_one :offlane_ranking

	def progress
		unless self.ranking.blank?
			if self.ranking.last_position == 0
				return "up"
			elsif self.ranking.current_position < self.ranking.last_position
				return "up"
			elsif self.ranking.current_position > self.ranking.last_position
				return "down"
			else
				return "no-change"
			end
		else
			return nil
		end
	end

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.uid = auth.uid
			user.nickname = auth.info.nickname
			user.real_name = auth.info.name
			user.profile_url = auth.extra.raw_info.profileurl
			user.avatar_url = auth.extra.raw_info.avatarfull
			user.visible_state = auth.extra.raw_info.communityvisibilitystate
			user.steamid = Steam::uid_to_steamid(auth.uid)
			user.location = auth.info.location
			user.last_seen = Time.at(auth.extra.raw_info.lastlogoff)
			user.time_created = Time.at(auth.extra.raw_info.timecreated) rescue nil
			user.save!
		end
	end

	def self.update_attributes
		lim = 100
		off = 0
		while true
			users = User.all.limit(lim).offset(off)
			if users.length > 0
				uids = users.collect{|u| u.uid}
				updates = Steam::get_users_info_from_steam(uids)
				updates.each do |up|
					user = User.find_by(uid: up["steamid"])
					Rails.logger.info("USER: #{user.inspect}")
					user.nickname = up["personaname"]
					user.real_name = up["realname"]
					user.profile_url = up["profileurl"]
					user.avatar_url = up["avatarfull"]
					user.visible_state = up["communityvisibilitystate"]
					user.location = [up["loccityid"], up["locstatecode"], up["loccountrycode"]].join(", ")
					user.last_seen = Time.at(up["lastlogoff"])
					Rails.logger.info("CHANGED? #{user.changed.inspect}")
					if user.changed.length > 0
						user.save
					end
				end
				off += lim
				sleep(1)
			else
				break
			end
		end
	end


end
