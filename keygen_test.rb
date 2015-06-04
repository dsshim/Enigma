gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'keygen'

class KeyGenTest < Minitest::Test

  # def test_if_character_map_produced_is_correct
  #   keygen = KeyGen.new(Time.new.strftime("%e%m%y"))
  #   keygen.char_map
  #   assert_equal ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"," ",".",","], keygen.char_map
  # end

  def test_if_key_is_valid
    keygen = KeyGen.new
    keygen.key_gen
    assert keygen.key_gen
  end


  def test_if_offsets_are_correct
    keygen = KeyGen.new
    keygen.offsets
    assert_equal [8,2,2,5], keygen.offsets
  end

end