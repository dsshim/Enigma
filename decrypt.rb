class Decrypt

  attr_accessor :b, :char_map, :c, :a, :message, :key, :offset, :d


  def initialize(message, key, offsets)
    @offset = offsets
    @message = message
    @key = key

  end

  def char_map
    @char_map = ("a".."z").to_a+("0".."9").to_a.push(" ", ".", ",")
  end


  def a_rotation
    key_num_a = @key.values_at(0, 1).join("").to_i
    offset_num_a = @offset.values_at(0).join("").to_i
    @a = key_num_a + offset_num_a
  end

  def b_rotation
    key_num_b = @key.values_at(1, 2).join("").to_i
    offset_num_b = @offset.values_at(1).join("").to_i
    @b = key_num_b + offset_num_b
  end

  def c_rotation
    key_num_c = @key.values_at(2, 3).join("").to_i
    offset_num_c = @offset.values_at(2).join("").to_i
    @c = key_num_c + offset_num_c
  end

  def d_rotation
    key_num_d = @key.values_at(3, 4).join("").to_i
    offset_num_d = @offset.values_at(3).join("").to_i
    @d = key_num_d + offset_num_d
  end

  def decrypt
    msg = []
    @message.split("").each_slice(4) { |chunk| msg<<chunk }
    decrypted = msg.map { |split|
      split.map.with_index { |letter, index|
        if index == 0
          @char_map.rotate(-@a)[@char_map.index(letter)]
        elsif index == 1
          @char_map.rotate(-@b)[@char_map.index(letter)]
        elsif index == 2
          @char_map.rotate(-@c)[@char_map.index(letter)]
        else
          index == 3
          @char_map.rotate(-@d)[@char_map.index(letter)]
        end } }

    decrypted.join

  end

end

