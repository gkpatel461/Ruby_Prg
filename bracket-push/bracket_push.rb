class Brackets
    def self.paired?(input)
      if input==''
        return true
      end
      input=input.split('')
      stack=[]
      flag=true

    input.each do |i|

        case(i)

          when '('
            stack.push('(')

          when ')'
            if stack.last=='('
              stack.pop
            else
              flag=false
            end

          when '{'
            stack.push('{')

          when '}'
            if stack.last=='{'
              stack.pop
            else
              flag=false
            end

          when '['
            stack.push('[')

          when ']'
            if stack.last=='['
              stack.pop
            else
              flag=false
            end

          else
            next
        end
      end

        if stack.length==0 && flag==true
          return true
        else
          return false
        end
      end
    end
