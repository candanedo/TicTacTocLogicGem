class TicTacToe
# Em la clase initialize necesitamos almacenar nuestro arreglo con las posiciones
# del juego
	def initialize grid
		@grid = grid
		@options = ["1","2","3","4","5","6","7","8","9"]
	end
# Metodo que se encarga de mostrar el contenido de la matriz que incluye posiciones.
	def display_grid
		@grid.each{ |g|
			print g
			puts
		}
	end
# Metodo que se encarga de ejecutar la accion de cada jugador dependiendo de los
# parametros que se envien al metodo instanciado.
	def conditions_game turno, player
		
		symbol = player ? "X" : "O"
		puts symbol
		case turno
			when 1
				@grid[0][0] = symbol
			when 2
				@grid[0][1] = symbol
			when 3
				@grid[0][2] = symbol
			when 4
				@grid[1][0] = symbol
			when 5
				@grid[1][1] = symbol
			when 6
				@grid[1][2] = symbol
			when 7
				@grid[2][0] = symbol
			when 8
				@grid[2][1] = symbol
			when 9
				@grid[2][2] = symbol
			else
				return {:data => "Error Fuera de Matriz", :status => false}
			end
	end

# Metodo que se encarga de validar si alguno de los jugadores quiere utilizar un
# campo que ya ha sido utilizado con anterioridad.
	def validate field
		case field
			when 1
				#return @grid[0][0] != "1" ? true : false
				return @grid[0][0] == "X" || @grid[0][0] == "O" ? false : true
			when 2
				return @grid[0][1] == "X" || @grid[0][1] == "O" ? false : true
			when 3
				return @grid[0][2] == "X" || @grid[0][2] == "O" ? false : true
			when 4
				return @grid[1][0] == "X" || @grid[1][0] == "O" ? false : true
			when 5
				return @grid[1][1] == "X" || @grid[1][1] == "O" ? false : true
			when 6
				return @grid[1][2] == "X" || @grid[1][2] == "O" ? false : true
			when 7
				return @grid[2][0] == "X" || @grid[2][0] == "O" ? false : true
			when 8
				return @grid[2][1] == "X" || @grid[2][1] == "O" ? false : true
			when 9
				return @grid[2][2] == "X" || @grid[2][2] == "O" ? false : true
			else
				return {:data => "Error Fuera de Matriz", :status => false}
		end
	end
# Metodo que se encarga de validar si existe un ganador de acuerdo al juego TicTacToe
# Evalua en manera horizontal, vertical, y diagonalmente.
	def winner
		#Condiciones para diagonal
		return false if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
		return false if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
		return false if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
		return false if @grid[0][0] == @grid[0][1] && @grid[0][1] == @grid[0][2]
		return false if @grid[1][0] == @grid[1][1] && @grid[1][1] == @grid[1][2]
		return false if @grid[2][0] == @grid[2][1] && @grid[2][1] == @grid[2][2]
		return false if @grid[0][0] == @grid[1][0] && @grid[1][0] == @grid[2][0]
		return false if @grid[0][1] == @grid[1][1] && @grid[1][1] == @grid[2][1]
		return false if @grid[0][2] == @grid[1][2] && @grid[1][2] == @grid[2][2]
	end
end#Fin de la declaracion de la clase

#..............................MAIN.............................................
grid = [["1", "2", "3"],["4", "5", "6"],["7", "8", "9"]]
game_on = true
contador = 0
ttt = TicTacToe.new(grid)
player = true


while game_on || contador < 10
	contador += 1
	move = gets.to_i


	if ttt.validate(move) == true
		ttt.conditions_game(move, player)
	else
		while ttt.validate(move) == false
			return {:data => "Error ese campo ya fue utilizado por el oponente", :status => false}
			move_p1 = gets.to_i
		end
		ttt.conditions_game(move, player)
	end

	if ttt.winner == false
		
		game_on = false
		return {:data => player, :status => true} 
	end


	player = !player
#..........................JUGADOR 2 O..........................................
end

