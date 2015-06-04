require "pry"

class KeyGen

  def initialize
    @offset = []
    @time = []
    @curr_time = Time.new.strftime("%e%m%y")
  end

  def key_gen
    @key = (0..4).collect { rand(0..9) }
  end

  def offsets
    @time.push(@curr_time)
    sq_num = @time.join("").to_i**2
    @offset = sq_num.to_s.reverse.slice!(0..3).reverse.to_s.each_char.map(&:to_i)
  end

  # def time
  #  key=KeyGen.new(@curr_time)
  #    key.offsets
  #  end
end

