class Matrix
  attr_reader :rows, :columns

  def initialize(string_matrix)
    @string_matrix = string_matrix
    @rows = fetch_rows
    @columns = fetch_rows.transpose
  end

  def fetch_rows
    @string_matrix.split("\n").map { |e| e.split(' ').map { |e| e.to_i  } }
  end

  def saddle_points
    @mat=[]
    output=[]
    columns_max=0
    x=0
    string_mat=@string_matrix.split("\n")
    string_mat.each do |rows|
      x1=rows.split(' ')
      x2=[]
      x1.each do |element|
          x2.push(element.to_i)
      end
      @mat.push(x2)
    end
    len=@mat.length-1
    (0..@rows.length-1).each do |i|
        columns_max=@rows[i].max
        x=@rows[i].index(columns_max)
        (0..len).each do |y|
          if columns_max==(@columns[x].min)
            out=[]
            out.push(i)
            out.push(x)
            output.push(out)
          end
        end
      end
 output.uniq
end
end
