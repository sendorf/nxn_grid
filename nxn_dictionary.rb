# nxn_dictionary.rb
class Nxn_Dictionary
	def generate(dimension)
		o = [('A'..'Z')].map { |i| i.to_a }.flatten
		nxn_grid = []
		dimension.times do
			string = (0...dimension).map { o[rand(o.length)] }.join(" ") # Generates a random string of length 'dimension'
			#puts string
			nxn_grid << string
		end
		nxn_grid
	end

	def horizontal_l2r(grid)
		words = 0
		dict = []
		dict = load_dictionary
		dict.each do |word|
			grid.each do |line|
				line = line.gsub(/\s+/, "")
				if (line.include? word)
					words = words + 1
				end
			end
		end
		words
	end

	def load_dictionary()
		dict = []
		dictionary_path = File.expand_path("../Dictionary/dict.txt", __FILE__)
		f = File.open(dictionary_path, "r")
		f.each_line do |line|
 			dict << line.split(' ').first
		end
		f.close
		dict.compact
	end
	
end