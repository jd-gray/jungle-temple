class Location < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true

	def self.save_response(input, user)
		response = HTTParty.get("http://api.zippopotam.us/us/#{input}")
		data = response.parsed_response
		location = Location.new(zip_code: data["post code"], country: data["country"], country_abbr: data["country abbreviation"],
														place_name: data["places"][0]["place name"], long: data["places"][0]["longitude"],
														lat: data["places"][0]["latitude"], state: data["places"][0]["state"],
														state_abbr: data["places"][0]["state abbreviation"], user_id: user.to_i)
		location.save
	end

end
