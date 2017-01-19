class Squares

  def initialize(n)
    @n=n
  end
  def square_of_sum
    return (@n*(@n+1)/2)**2
  end

  def sum_of_squares
    return (@n*(2*@n+1)*(@n+1))/6
  end

  def difference
    return square_of_sum - sum_of_squares
  end
end
