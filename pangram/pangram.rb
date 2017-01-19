class Pangram
  def self.pangram?(input)
    if input==""
      return false
    end
    input = input.downcase.split('')
      flag=true
     ('a'..'z').each do |i|
          if flag==false
            flag=false
            break
          end
            input.each do |j|
                if i==j
                  flag=true
                  break
                else
                  flag=false
                end
            end
      end
      if flag==true
        true
      else
        false
      end
  end
end
