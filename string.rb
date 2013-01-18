def caesar_cipher(str, shift)
  str_as_arr = str.split('')
  new_ord = (('a'.ord - 97) + shift) % 26

  new_str = str_as_arr.map { |let| ((((let.ord - 97)+shift)%26)+97).chr }
  new_str.join
end