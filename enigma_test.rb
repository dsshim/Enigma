gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'keygen'
require_relative "file_io"
require_relative "decrypt"
require_relative "encrypt"
require_relative "crack"

class FileIOTest < Minitest::Test


  def test_if_program_outputs_correct_output

    file= FileIO.new("message.txt","encrypted.txt")
    file.read_message_dec
    assert_equal "abcdabcdabcdabcd..end..", file.read_message_dec

  end


end