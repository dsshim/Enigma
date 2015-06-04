gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'file_io'

class FileIOTest < Minitest::Test

  def test_if_it_reads_the_correct_text
    file = FileIO.new
    file.read_message
    assert_equal "is simply dummy text of the printing and typesetting industry. lorem ipsum has been the industrys standard dummy text ever since the 1500s, when ...end...", file.read_message
  end


  def test_if_it_reads_the_correct_decrypted_text
    file=FileIO.new
    file.read_message_dec
    assert_equal "is simply dummy text of the printing and typesetting industry. lorem ipsum has been the industrys standard dummy text ever since the 1500s, when ...end...", file.read_message_dec
  end

  def test_if_it_reads_the_correct_output_text
    file=FileIO.new
    file.read_output_cracked_key
    assert_equal "08580", file.read_output_cracked_key
  end

end