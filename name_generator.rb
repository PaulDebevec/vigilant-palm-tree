
def shitty_name_generator
  vowels = /[aeiou]/
  vs_and_cs = ('a'..'z').partition { |letter| vowels.match(letter) }
  # random name length
  name_length = (2..5).to_a.sample
  # if start_letter is even, name will start with a vowel
  start_even_if_two = (1..3).to_a.sample
  name = ""
  if name == "" && start_even_if_two == 2
    name = vs_and_cs[0].sample
  elsif name == "" &&  start_even_if_two == 1 || name == "" && start_even_if_two == 3
    name = vs_and_cs[1].sample
  end
  # Loop adds characters to name until the length == name_length
  until name.split('').length == name_length
    if name.length == 1 && vs_and_cs[1].include?(name)
      name.insert(-1, vs_and_cs[0].sample)
    elsif name.length == 1 && vs_and_cs[0].include?(name)
      name.insert(-1, vs_and_cs[1].sample)
    elsif name.length % 2 == 1 && name.split('').length < name_length
      name.insert(-1, vs_and_cs[0].sample)
    elsif name.length % 2 == 0 && name.split('').length < name_length
      name.insert(-1, vs_and_cs[1].sample)
    elsif name.split('').length == name_length
      return
    end
  end
  name
end

shitty_name_generator
# require "pry"; binding.pry
