#require_relative "enigma"
require "pry"


class FileIO

  def initialize(text="message.txt", encrypted="encrypted.txt")
    @text = text
    @encrypted = encrypted
    @decrypted = "decrypt.txt"
    @output = "output.txt"
  end


  def write_message(crypted)
    message = File.open(@encrypted, "w")
    message.write(crypted)
    message.close
  end

  def write_message_dec(decrypt)
    message = File.open(@decrypted, "w")
    message.write(decrypt)
    message.close
  end

  def write_message_output(output)
    message=File.open(@output, "w")
    message.write(output)
    message.close
  end


  def read_message
    read =File.open(@text, "r")
    read.read
    #@read.close
  end

  def read_message_enc
    read_enc = File.open(@encrypted, "r")
    read_enc.read
    #@read_enc.close
  end

  def read_message_dec
    read_dec = File.open(@decrypted,"r")
    read_dec.read
  end

  def read_output_cracked_key
    read_crack = File.open(@output,"r")
    read_crack.read
  end

end

