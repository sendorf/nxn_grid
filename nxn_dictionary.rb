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
		dl2r_words = 0
		dr2l_words = 0
		dict = load_dictionary
		diagonal_grid = convert2diagonal(grid)
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
			diagonal_grid.each do |line|
				dl2r_line = line.gsub(/\s+/, "")				# Horizontal line form left to right
				dr2l_line = line.gsub(/\s+/, "").reverse		# The inverse horizontal line, from right to left
				if (dl2r_line.include? word)
					dl2r_words = dl2r_words + 1
				end
				if (dr2l_line.include? word)
					dr2l_words = dr2l_words + 1
				end
			end
		end
		puts grid
		puts "\nHorizontal words from left to right in your grid: #{hl2r_words}"
		puts "Horizontal words from right to left in your grid: #{hr2l_words}"
		puts "Diagonal words from left to right in your grid: #{dl2r_words}"
		puts "Diagonal words from right to left in your grid: #{dr2l_words}"
	end


	def convert2diagonal(grid)
		diagonal_grid = []
		diagonal_line = ""
		grid.length.times do |i|
			line = grid[i].gsub(/\s+/, "")
			diagonal_line = diagonal_line + line[i] + " "
		end
		diagonal_line.rstrip!
		diagonal_grid << diagonal_line
	end

	def convert2vertical(grid)
		vertical_grid = []
		trimmed_grid = []
		grid.each do |line|
			trimmed_grid << line.gsub(/\s+/, "")
		end
		puts trimmed_grid
		trimmed_grid.length.times do |i|
			vertical_line = ""
			trimmed_grid.length.times do |j|
				vertical_line = vertical_line + trimmed_grid[j][i] + " "
			end
			vertical_grid << vertical_line.rstrip!
		end
		vertical_grid
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