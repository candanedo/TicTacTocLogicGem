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
		if player
			case turno
				when 1
					@grid[0][0] = "X"
				when 2
					@grid[0][1] = "X"
				when 3
					@grid[0][2] = "X"
				when 4
					@grid[1][0] = "X"
				when 5
					@grid[1][1] = "X"
				when 6
					@grid[1][2] = "X"
				when 7
					@grid[2][0] = "X"
				when 8
					@grid[2][1] = "X"
				when 9
					@grid[2][2] = "X"
				else
					puts "Error"
			end
		elsif !player
			case turno
				when 1
					@grid[0][0] = "O"
 				when 2
					@grid[0][1] = "O"
				when 3
					@grid[0][2] = "O"
				when 4
					@grid[1][0] = "O"
				when 5
					@grid[1][1] = "O"
				when 6
					@grid[1][2] = "O"
				when 7
					@grid[2][0] = "O"
				when 8
					@grid[2][1] = "O"
				when 9
					@grid[2][2] = "O"
				else
					puts "Error"
			end
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
				return true
		end
	end
# Metodo que se encarga de validar si existe un ganador de acuerdo al juego TicTacToe
# Evalua en manera horizontal, vertical, y diagonalmente.
	def winner
		puts
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
player_1 = true
player_2 = false

while game_on
	contador += 1
	puts " "
	puts "------------------"
	puts " "
	ttt.display_grid
#..........................JUGADOR 1 X..........................................

	if player_1
		puts
		puts "------------------"
		puts "Turno jugador 1: "
		puts "------------------"
		move_p1 = gets.to_i


		if ttt.validate(move_p1) == true
			ttt.conditions_game(move_p1, true)
		else
			while ttt.validate(move_p1) == false
				puts "Ese espacio ya fue utilizada ingrese de nuevo un comando"
				move_p1 = gets.to_i
			end
			ttt.conditions_game(move_p1, true)
		end

		if ttt.winner == false
			puts "El Ganador es el Jugador 1 (x)"
			game_on = false
		end
		player_1 = false
		player_2 = true
#..........................JUGADOR 2 O..........................................
	elsif player_2
		puts puts
		puts "------------------"
		puts "Turno jugador 2:"
		puts "------------------"
		move_p2 = gets.to_i

		if ttt.validate(move_p2) == true
			ttt.conditions_game(move_p2, false)
		else
			while ttt.validate(move_p2) == false
				puts "Ese espacio ya fue utilizada ingrese de nuevo un comando"
				move_p2 = gets.to_i
			end
			ttt.conditions_game(move_p2, false)
		end

		if ttt.winner == false
			puts "El Ganador es el Jugador 2 (O)"
			game_on = false
		end
		player_1 = true
		player_2 = false
	end
	ttt.display_grid
end
puts "End of Game"
