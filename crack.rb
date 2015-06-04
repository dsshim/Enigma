require "pry"

class Crack

  def initialize(message, offsets)
    @msg = message
    @offset = offsets
    @count = 0
  end

  def char_map
    @char_map = ("a".."z").to_a+("0".."9").to_a.push(" ", ".", ",")
  end


  def crack_key_array
    @key_array = (0..99999).map do |key|
      key.to_s.rjust(5, '0').split("").map(&:to_i)
    end


    def crack_key_gen

      @count+=1
      @crack_key = @key_array[@count]
    end


  end


  def crack
    crack = false
    crack_msg = []
    @msg.split("").each_slice(4) { |chars| crack_msg<<chars }

    until crack ==true

      cracked = crack_msg.map { |split|
        split.map.with_index { |letter, index|
          if index == 0
            @char_map.rotate(-@crack_a)[@char_map.index(letter)]
          elsif index == 1
            @char_map.rotate(-@crack_b)[@char_map.index(letter)]
          elsif index == 2
            @char_map.rotate(-@crack_c)[@char_map.index(letter)]
          else
            index == 3
            @char_map.rotate(-@crack_d)[@char_map.index(letter)]
          end } }

      if cracked.join.include?("..end..")== true
        crack = true
       return @crack_key.join


      else
        crack_key_gen
        crack_rot_a
        crack_rot_b
        crack_rot_c
        crack_rot_d

      end

    end
  end

  def crack_rot_a

    key_num_a = @crack_key.values_at(0, 1).join("").to_i
    offset_num_a = @offset.values_at(0).join("").to_i
    @crack_a = key_num_a + offset_num_a

  end

  def crack_rot_b
    key_num_b = @crack_key.values_at(1, 2).join("").to_i
    offset_num_b = @offset.values_at(1).join("").to_i
    @crack_b = key_num_b + offset_num_b

  end


  def crack_rot_c
    key_num_c = @crack_key.values_at(2, 3).join("").to_i
    offset_num_c = @offset.values_at(2).join("").to_i
    @crack_c = key_num_c + offset_num_c

  end

  def crack_rot_d
    key_num_d = @crack_key.values_at(3, 4).join("").to_i
    offset_num_d = @offset.values_at(3).join("").to_i
    @crack_d = key_num_d + offset_num_d
  end

end

