class Hamming

    def self.compute(dna1,dna2)
      if(dna1.length!=dna2.length)
        raise ArgumentError, "The length not matched"

      else
        i=0
        total=0
        dna1=dna1.split('')
        dna2=dna2.split('')
        until i>dna1.length do
          if dna1[i]!=dna2[i]
            total=total+1

          end
          i=i+1
        end
        return total


      end
    end
end
