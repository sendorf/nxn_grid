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

	def count(grid)
		hl2r_words = 0
		hr2l_words = 0
		dict = []
		dict = load_dictionary
		dict.each do |word|
			grid.each do |line|
				hl2r_line = line.gsub(/\s+/, "")				# Horizontal line form left to right
				hr2l_line = line.gsub(/\s+/, "").reverse		# The inverse horizontal line, from right to left
				if (hl2r_line.include? word)
					hl2r_words = hl2r_words + 1
				end
				if (hr2l_line.include? word)
					hr2l_words = hr2l_words + 1
				end
			end
		end
		puts grid
		puts "\nHorizontal words from left to right in your grid: #{hl2r_words}"
		puts "Horizontal words from right to left in your grid: #{hr2l_words}"
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

	def horizontal_r2l(grid)
		words = 0
		dict = []
		dict = load_dictionary
		dict.each do |word|
			grid.each do |line|
				line = line.gsub(/\s+/, "").reverse
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