require "rainbow"

module TicTacToe

  class Game

    def initialize options = {}
      @matrix = [
        [".", ".", "."],
        [".", ".", "."],
        [".", ".", "."]
      ]
      @current_player = "x"
      @options = options
    end

    def draw
      string = ""
      @matrix.each do |row|
        row.each do |cell|
          string << draw_cell(cell)
        end
        string << "\n"
      end
     string 
    end

    def play x, y
      @matrix[y][x] = @current_player
      update_player!
    end

    private

    def draw_cell cell
      color = if cell == "x" then :blue
              elsif cell == "o" then :red
              else :white
              end
      if @options[:color]
        Rainbow(cell).color color
      else
        cell
      end
    end

    def update_player!
      @current_player = if @current_player == "x" then "o"
                        else  "x"
                        end
    end

  end

end
