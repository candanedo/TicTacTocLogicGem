require 'TicTacToe'

puts puts puts
grid = [["1", "2", "3"],["4", "5", "6"],["7", "8", "9"]]
game_on = true
count = 0
player = true
helper = 0
ttt = TicTacToe.new(grid)
ttt.display_grid
while game_on && count < 9
	count += 1
	helper = player ? 1 : 2
	puts
	puts "------------------"
	puts "Turno jugador #{helper}: "
	puts "------------------"
	move = gets.to_i
	if ttt.validate?(move)
		ttt.conditions_game(move, player)
	else
		while ttt.validate?(move) == false
			puts "Ese espacio ya fue utilizada o esta utilizando un comando incorrecto ingrese de nuevo un comando"
			move = gets.to_i
		end
		ttt.conditions_game(move, player)
	end
	if ttt.winner == false
		puts "El Ganador es el Jugador #{helper}!"
		game_on = false
	end
	puts "Fue un empate" if game_on && count ==  9
	player = !player
	ttt.display_grid
end
puts "End of Game"