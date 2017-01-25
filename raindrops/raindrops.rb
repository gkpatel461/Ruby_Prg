class Raindrops
  def self.convert(a)
    output=''
    if a%3==0
      output+='Pling'
    end
    if a%5==0
      output+='Plang'
    end
    if a%7==0
      output+='Plong'
    end
    if output==''
      return a.to_s
    else
      return output
    end
  end
end
