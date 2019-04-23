import wollok.game.*
import comidas.*
object roque {
	var property mochila 
	var property position = game.at(6,4)
	method image() = "jugador.png" 
	
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	
	method tomarComida(comida){
		if (mochila != null){
			game.addVisualIn(mochila, self.randomPositionInGame())
			game.whenCollideDo(mochila, {entrenador => entrenador.tomarComida(mochila)})
			game.removeVisual(comida)
			mochila = comida 
		}
		else {
			game.removeVisual(comida)
			mochila = comida 
		}
	}
	
	method randomPositionInGame(){
		return game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0))
	}
}

	