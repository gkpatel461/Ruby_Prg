class Robot
  NAME= ("A".."Z").to_a
  def initialize
    @name = ''
    @name =  NAME.sample(2).join+ Time.now.nsec.to_s[-3..-1]
  end
  def name
    @name
  end
  def reset
    initialize
  end
end