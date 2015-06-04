require_relative "keygen"
require_relative "file_io"
require_relative "encrypt"
require_relative "decrypt"
require_relative "crack"
require "pry"


message_text = ARGV[0]
encrypted_text = ARGV[1]


key_gen = KeyGen.new
key = key_gen.key_gen

offset_gen = KeyGen.new
offsets = offset_gen.offsets
curr_time = Time.new.strftime("%e%m%y")



puts "Created #{encrypted_text} with the key #{key.join("")} on#{curr_time}"

code = FileIO.new(message_text, encrypted_text)
message = code.read_message



enc = Encrypt.new(message, key, offsets)
enc.char_map
enc.a_rotation
enc.b_rotation
enc.c_rotation
enc.d_rotation
crypted = enc.encrypt
code.write_message(crypted)


enc_message = code.read_message_enc

dec = Decrypt.new(enc_message, key, offsets)
dec.char_map
dec.a_rotation
dec.b_rotation
dec.c_rotation
dec.d_rotation
decrypted = dec.decrypt
code.write_message_dec(decrypted)

crack = Crack.new("vaatle9d7w olz4o8zag,wlj596.lx0,1206", offsets)
crack.char_map
crack.crack_key_array
crack.crack_key_gen
crack.crack_rot_a
crack.crack_rot_b
crack.crack_rot_c
crack.crack_rot_d
output =crack.crack
code.write_message_output(output)




