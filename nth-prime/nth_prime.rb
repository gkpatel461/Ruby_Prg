require 'prime'
class Prime
  def  self.nth(nth_num)
    raise ArgumentError  if nth_num == 0
    prime_numbers=Prime.first nth_num
    prime_numbers[nth_num-1]
    end

end
module BookKeeping
	VERSION = 1
end