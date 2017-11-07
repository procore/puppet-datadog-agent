# A custom function to take fingerprints and format them for comparing against `apt-key fingerprint`
module Puppet::Parser::Functions
  newfunction(:fingerprint_formatter, type: :rvalue) do |args|
    fingerprint = args[0]

    if fingerprint.nil?
      raise Puppet::ParseError, 'fingerprint_formatter requires a fingerprint to format as an argument.'
    end

    fingerprint_broken_up = []
    beginning, ending = 0, 3
    10.times do
      fingerprint_broken_up << fingerprint.split('')[beginning..ending]
      beginning += 4
      ending += 4
    end

    "#{broken_up[0..4].join(" ")}  #{broken_up[5..10].join(" ")}"
  end
end
