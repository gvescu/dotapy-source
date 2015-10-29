class Ranking < ActiveRecord::Base
	belongs_to :user

	self.per_page = 10

	def self.calculate_score
		matches = Match.where(processed: false)
		matches.each do |match|
			match.match_details.each do |d|
				player = Ranking.find_or_initialize_by(user_id: d.user_id)
				player.kills += d.kills
				player.deaths += d.deaths
				player.assists += d.assists
				player.last_hits += d.last_hits
				player.denies += d.denies
				player.top_gold_per_min = d.gold_per_min > player.top_gold_per_min ? d.gold_per_min : player.top_gold_per_min
				player.top_xp_per_min = d.xp_per_min > player.top_xp_per_min ? d.xp_per_min : player.top_xp_per_min
				player.matches += 1
				if d.victory
					player.wins += 1
					player.score += 20
				else
					player.loses += 1
					player.score -= 20
				end
				if d.penalty > 0
					player.penalties += d.penalty
					player.score -= d.penalty
				end
				player.save
				if d.role > 0
					role_ranking = eval("#{MatchDetail.roles[d.role].capitalize}Ranking").find_or_initialize_by(user_id: d.user_id)
					role_ranking.kills += d.kills
					role_ranking.deaths += d.deaths
					role_ranking.assists += d.assists
					role_ranking.last_hits += d.last_hits
					role_ranking.denies += d.denies
					role_ranking.top_gold_per_min = d.gold_per_min > role_ranking.top_gold_per_min ? d.gold_per_min : role_ranking.top_gold_per_min
					role_ranking.top_xp_per_min = d.xp_per_min > role_ranking.top_xp_per_min ? d.xp_per_min : role_ranking.top_xp_per_min
					role_ranking.matches += 1
					if d.victory
						role_ranking.wins += 1
						role_ranking.score += 20
					else
						role_ranking.loses += 1
						role_ranking.score -= 20
					end
					if d.penalty > 0
						role_ranking.penalties += d.penalty
						role_ranking.score -= d.penalty
					end
					role_ranking.save
				end
			end
			match.processed = true
			match.save
		end
		order = 1
		Ranking.order("score DESC, matches ASC, wins DESC, loses ASC, kills DESC, deaths ASC, assists DESC, last_hits DESC, denies DESC, top_gold_per_min DESC, top_xp_per_min DESC").each do |r|
			r.last_position = r.current_position
			r.current_position = order
			r.save
			order += 1
		end
		order = 1
		CarryRanking.order("score DESC, matches ASC, wins DESC, loses ASC, kills DESC, assists DESC, deaths ASC, last_hits DESC, top_gold_per_min DESC, top_xp_per_min DESC, denies DESC").each do |r|
			r.last_position = r.current_position
			r.current_position = order
			r.save
			order += 1
		end
		order = 1
		SupportRanking.order("score DESC, matches ASC, wins DESC, loses ASC, assists DESC, deaths ASC, kills DESC, denies DESC, last_hits DESC, top_xp_per_min DESC, top_gold_per_min DESC").each do |r|
			r.last_position = r.current_position
			r.current_position = order
			r.save
			order += 1
		end
		order = 1
		MidRanking.order("score DESC, matches ASC, wins DESC, loses ASC, kills DESC, deaths ASC, assists DESC, last_hits DESC, denies DESC, top_gold_per_min DESC, top_xp_per_min DESC").each do |r|
			r.last_position = r.current_position
			r.current_position = order
			r.save
			order += 1
		end
		order = 1
		OfflaneRanking.order("score DESC, matches ASC, wins DESC, loses ASC, kills DESC, deaths ASC, assists DESC, last_hits DESC, denies DESC, top_gold_per_min DESC, top_xp_per_min DESC").each do |r|
			r.last_position = r.current_position
			r.current_position = order
			r.save
			order += 1
		end
	end
end