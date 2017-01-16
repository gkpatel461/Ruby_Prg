class Complement
    def self.of_dna(dna)
      dna=dna.split('')
      rna=''
      i=0
      until dna.length<=i do

        case dna[i]
        when 'A'
          rna = rna + 'U'
        when 'T'
          rna = rna + 'A'
        when 'C'
          rna = rna + 'G'
        when 'G'
          rna = rna + 'C'
        else
          rna = ''
          break
        end
        i=i+1
      end
        return rna

      end

      end
