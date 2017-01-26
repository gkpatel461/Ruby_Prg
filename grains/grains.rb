class Grains
	def self.square(no_square)
		if no_square<=0||no_square>64
			raise ArgumentError
		else
			2**(no_square-1)
		end
	end
	def self.total
		2**64 - 1
	end
end
module BookKeeping
	VERSION=1
end