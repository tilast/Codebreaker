# require "codebreaker/version"

module Codebreaker
  class Game

    def initialize(output)
      @output = output
    end

    def start(secret = nil, attempts = nil)
      @secret = secret
      @attempts = attempts ? attempts : 10

      @secret = secretCode unless @secret

      @output.puts 'Welcome to Codebreaker!'
      @output.puts "You have an #{@attempts} attempts to guess the number"
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      @attempts -= 1;

      return false unless lose

      marker = Marker.new(@secret, guess)
      @output.puts  '+' *marker.exact_match_count + 
                    '-' *marker.number_match_count

      return false unless win(marker)

    end

    def secretCode
      options = %w[1 2 3 4 5 6]
      (0..3).map { options.delete_at(rand(options.length))}.join
    end

    def lose
      if @attempts == 0
        @output.puts "You lose! Secret code was #{@secret}"

        return false
      end      
    end

    def win(marker)
      if marker.exact_match_count == 4
        @output.puts 'You win!'

        return false
      end
    end

  end
end