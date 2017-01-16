class Hamming

    def self.compute(dna,rna)
      if(dna.length!=rna.length)
        raise ArgumentError, "The length not matched"

      else
        i=0
        total=0
        dna=dna.split('')
        rna=rna.split('')
        until i>dna.length do
          if dna[i]!=rna[i]
            total=total+1

          end
          i=i+1
        end
        return total


      end
    end
end
