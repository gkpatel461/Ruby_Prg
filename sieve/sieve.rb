require 'prime'
class Sieve
  def initialize(input)
    @input = input
  end
  def primes
    array_of_primes = []
    return []  if @input == 1
    return [2] if @input == 2
    
    Prime.each(@input) do |i|
      array_of_primes.push(i)
    end
      array_of_primes
end
end