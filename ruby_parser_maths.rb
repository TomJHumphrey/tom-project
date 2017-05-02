require 'strscan'

class TomsRubyParser

  attr_reader :tokens

  def initialize

    puts 'I am a fantastic Ruby Parser!'

    @string_scanner

    @tokens = []

  end

  def parse_external_file(file_location)

    ruby_file_content = get_file_content(file_location)

    puts ruby_file_content

    @string_scanner = create_string_scanner( ruby_file_content)

    #number = parse_number

    while @string_scanner.rest?

      number = parse_number

      if number == 'number expected' then
        #@string_scanner.pos = @string_scanner.pos + 1

        operator = parse_operator

        if operator != nil then
          @tokens << operator
        end

        puts "Testing operator parsing #{operator}"
      else @tokens << number
      end

      puts "Testing number parsing #{number}"

    end

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

  def parse_number

    @string_scanner.skip(/\s+/)

    @string_scanner.scan(/[\d.]+/) || 'number expected'

  end

  def parse_operator

    puts 'parsing operator'

    @string_scanner.skip(/\s+/)

    #puts "next char #{@string_scanner.peek(1)}"

    @string_scanner.scan(/[+|\-|\*|\/]/)

  end
end