gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'file_io'

class FileIOTest < Minitest::Test

  def test_if_it_reads_the_correct_text
    file = FileIO.new
    file.read_message
    assert_equal "abcdabcdabcdabcd..end..", file.read_message
  end


  def test_if_it_reads_the_correct_decrypted_text
    file=FileIO.new
    file.read_message_dec
    assert_equal "abcdabcdabcdabcd..end..", file.read_message_dec
  end

  def test_if_it_reads_the_correct_output_text
    file=FileIO.new
    file.read_output_cracked_key
    assert_equal "06268", file.read_output_cracked_key
  end

end