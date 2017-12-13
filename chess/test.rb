require_relative 'board'
require_relative 'display'

b = Board.new
d = Display.new b

while true
	d.render
	d.cursor.get_input
end
