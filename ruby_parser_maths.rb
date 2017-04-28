require 'strscan'

class TomsRubyParser

  def initialize

    puts 'I am a fantastic Ruby Parser!'

  end

  def parse_external_file(file_location)

    ruby_file_content = get_file_content(file_location)

    puts ruby_file_content

    @string_scanner = create_string_scanner( ruby_file_content)

    number = parse_number(@string_scanner)

    puts "Testing number parsing #{number}"

  end

  def get_file_content(file_location)

    ruby_file = File.new(file_location)

    ruby_file.read

  end

  def create_string_scanner(ruby_file_content)

    string_scanner = StringScanner.new(ruby_file_content)

    string_scanner.pos

    string_scanner

  end

  def parse_number(string_scanner)

    string_scanner.skip(/\s+/)

    string_scanner.scan(/[\d.]+/) || 'number expected'

  end

end