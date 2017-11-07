# A custom function to take fingerprints and format them for comparing against `apt-key fingerprint`
# fingerprint_formatter("6F6B15509CF8E59E6E469F327F438280EF8D349F") == "6F6B 1550 9CF8 E59E 6E46  9F32 7F43 8280 EF8D 349F"
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

    fingerprint_broken_up.map! { |section| section.join }

    "#{fingerprint_broken_up[0..4].join(" ")}  #{fingerprint_broken_up[5..10].join(" ")}"
  end
end
