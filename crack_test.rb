gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'crack'

class CrackTest < Minitest::Test

  def test_if_character_map_is_correct
    crack = Crack.new("abcdabcdabcdabcd",[8,2,2,5])
    crack.char_map
    assert_equal ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"," ",".",","], crack.char_map
  end


  def test_if_crack_key_array_is_correct
    crack = Crack.new("abcdabcdabcdabcd",[8,2,2,5])
    crack.crack_key_array
    return crack.crack_key_array[0]
    assert_equal [[0,0,0,0,0]], crack.crack_key_array[0]
  end

  def test_if_crack_key_gen_iterates_properly
    crack = Crack.new("abcdabcdabcdabcd",[8,2,2,5])
    crack.crack_key_array
    crack.crack_key_gen
    assert_equal [0,0,0,0,2], crack.crack_key_gen
  end


  def test_if_crack_rot_a_is_correct
    crack = Crack.new("abcdabcdabcdabcd",[8,2,2,5])
    crack.char_map
    crack.crack_key_array
    crack.crack_key_gen
    crack.crack_rot_a
    assert_equal 8, crack.crack_rot_a
  end

  def test_if_crack_rot_b_is_correct
    crack = Crack.new("abcdabcdabcdabcd",[8,2,2,5])
    crack.char_map
    crack.crack_key_array
    crack.crack_key_gen
    crack.crack_rot_b
    assert_equal 2, crack.crack_rot_b
  end

  def test_if_crack_rot_c_is_correct
    crack = Crack.new("abcdabcdabcdabcd",[8,2,2,5])
    crack.char_map
    crack.crack_key_array
    crack.crack_key_gen
    crack.crack_rot_c
    assert_equal 2, crack.crack_rot_c
  end

  def test_if_crack_rot_d_is_correct
    crack = Crack.new("abcdabcdabcdabcd",[8,2,2,5])
    crack.char_map
    crack.crack_key_array
    crack.crack_key_gen
    crack.crack_rot_d
    assert_equal 6, crack.crack_rot_d
  end


  def test_if_it_cracks
    crack = Crack.new("qjmbqjmbqjmbqjmbogoltgi",[8,2,2,5])
    crack.char_map
    crack.crack_key_array
    crack.crack_key_gen
    crack.crack_rot_a
    crack.crack_rot_b
    crack.crack_rot_c
    crack.crack_rot_d
    crack.crack
    assert_equal "08471", crack.crack
  end


end
