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

	def horizontal_l2r(grid)
		words = 0
		dictionary = load_dictionary
		dictionary.each do |word|
			grid.each do |line|
				if line.include? word
					words = words + 1
				end
			end
		end
		words
	end

	def load_dictionary()
		dictionary = []
		dictionary_path = File.dirname($0) + '../Dictionary/dict.txt'
		f = File.open(dictionary_path, "r")
		f.each_line do |line|
 			dictionary << line.split(' ').first
		end
		f.close
		dictionary
	end
	
end