gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'encrypt'

class EncryptTest < Minitest::Test

  def test_if_character_map_is_correct
    encrypt = Encrypt.new("Hello",[0,0,0,0,1],[8,2,2,5])
    encrypt.char_map
    assert_equal ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"," ",".",","], encrypt.char_map
  end


def test_if_rotation_a_is_correct
  encrypt = Encrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
  encrypt.a_rotation
  assert_equal 8, encrypt.a_rotation
end


  def test_if_rotation_b_is_correct
    encrypt = Encrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
    encrypt.b_rotation
    assert_equal 2, encrypt.b_rotation
  end


  def test_if_rotation_c_is_correct
    encrypt = Encrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
    encrypt.c_rotation
    assert_equal 2, encrypt.c_rotation
  end

  def test_if_rotation_d_is_correct
    encrypt = Encrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
    encrypt.d_rotation
    assert_equal 6, encrypt.d_rotation
  end

  def test_if_it_encrypts
    encrypt = Encrypt.new("abcdabcdabcdabcd",[0,0,0,0,1],[8,2,2,5])
    encrypt.char_map
    encrypt.a_rotation
    encrypt.b_rotation
    encrypt.c_rotation
    encrypt.d_rotation
    encrypt.encrypt
    assert_equal "idejidejidejidej", encrypt.encrypt
  end
end