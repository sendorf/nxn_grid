# nxn_dictionary.rb
class Nxn_Dictionary
	def generate(dimension)
		o = [('A'..'Z')].map { |i| i.to_a }.flatten
		nxn_grid = []
		dimension.times do
			string = (0...dimension).map { o[rand(o.length)] }.join(" ") # Generates a random string of length 'dimension'
			puts string
			nxn_grid << string
		end
		nxn_grid
	end
	
end