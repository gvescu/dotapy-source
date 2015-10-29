module Steam

	STEAMID64IDENTIFIER = 0x0110000100000000
	STEAMAPIKEY = "<YOUR-STEAM-WEB-API-KEY-HERE>"

	class << self
		def uid_to_steamid(uid)
			x, y, z = 0, 0, 0
			y = uid.to_i % 2
			z = (uid.to_i - STEAMID64IDENTIFIER - y) / 2
			return "STEAM_#{x}:#{y}:#{z}"
		end

		def steamid_to_uid(steamid)
			x, y, z, uid = 0, 0, 0, 0
			tmplength = steamid.split("_").length
			if tmplength == 2
				x, y, z = steamid.split("_").last.split(":")
			elsif tmplength == 1
				x, y, z = steamid.split("_").first.split(":")
			else
				return false
			end
			uid = z.to_i * 2 + STEAMID64IDENTIFIER + y.to_i
			return uid.to_s
		end

		def custom_url_to_steamid(custom_url, type="steamid")
			require 'open-uri'
			last = custom_url.split("/").last
			if last == "/"
				last = custom_url.split("/").last(2).first
			end
			result = JSON.parse(open("http://api.steampowered.com/ISteamUser/ResolveVanityURL/v0001/?key=#{STEAMAPIKEY}&vanityurl=#{last}").read)
			if type == "uid"
				return result["response"]["steamid"]
			else
				return uid_to_steamid(result["response"]["steamid"])
			end
		end

		def steamid64_to_steamid32(steamid64)
			return (steamid64.to_i - STEAMID64IDENTIFIER).to_s
		end

		def steamid32_to_steamid64(steamid32)
			return ('765' + (steamid32.to_i + 61197960265728).to_s).to_s
		end

		# UPDATE USER INFO
		def get_users_info_from_steam(uids)
			require 'open-uri'
			result = JSON.parse(open("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{STEAMAPIKEY}&steamids=#{uids.join(",")}").read)
			return result["response"]["players"]
		end

	end

end