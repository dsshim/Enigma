gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'decrypt'

class DecryptTest < Minitest::Test

  def test_if_character_map_is_correct
    decrypt = Decrypt.new("Hello",[0,0,0,0,1],[8,2,2,5])
    decrypt.char_map
    assert_equal ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"," ",".",","], decrypt.char_map
  end


  def test_if_rotation_a_is_correct
    decrypt = Decrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
    decrypt.a_rotation
    assert_equal 8, decrypt.a_rotation
  end


  def test_if_rotation_b_is_correct
    decrypt = Decrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
    decrypt.b_rotation
    assert_equal 2, decrypt.b_rotation
  end


  def test_if_rotation_c_is_correct
    decrypt = Decrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
    decrypt.c_rotation
    assert_equal 2, decrypt.c_rotation
  end

  def test_if_rotation_d_is_correct
    decrypt = Decrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
    decrypt.d_rotation
    assert_equal 6, decrypt.d_rotation
  end

  def test_if_it_encrypts
    decrypt = Decrypt.new("idejidejidejidej",[0,0,0,0,1],[8,2,2,5])
    decrypt.char_map
    decrypt.a_rotation
    decrypt.b_rotation
    decrypt.c_rotation
    decrypt.d_rotation
    decrypt.decrypt
    assert_equal "abcdabcdabcdabcd", decrypt.decrypt
  end

end