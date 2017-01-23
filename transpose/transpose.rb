require 'matrix'
class Transpose
  def self.transpose(input)
    @mat=[]
    output=[]
    l_max=0

    string_mat = input.split("\n")
    string_mat.each do |rows|
        l1 = rows.length
        if l1 >= l_max
          l_max = l1
        end
      end

      string_mat.each do |rows|
          x1 = rows.split("")
          x2 = []
          k = 0
          x1.each do |element|
              x2.push(element)
              k += 1
          end
          if k < l_max
            (k+1..l_max).each do |i|
               x2.push(" ")
            end
          end
        @mat.push(x2)
        end
 @mat = @mat.transpose
   output = []
  @mat.each do |obj|
    flag = 0
    obj.each do |obj1|
      if obj1 == " "
        flag += 1
      end
    end
    if(obj.length == flag)
      output.push("%%")
    else
      output.push(obj.join)
    end
  end
output = output.join("\n")
output = output.gsub(/\s+$/,'')
  output.gsub(/%/,'')
end
end
