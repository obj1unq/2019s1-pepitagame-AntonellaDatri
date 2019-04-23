import wollok.game.*
import comidas.*
import pepita.*

object roque {

	var property mochila = null
	var property position = game.at(6, 4)

	method image() = "jugador.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	
	method alimentar(ave){
		if (mochila == null) {
			//no hace nada
		}
		else{
			ave.come(mochila)
			self.soltar(mochila)
			mochila = null
		}
	}
	method tomarComida(comida) {
		if (mochila != null) {
			self.soltar(mochila)
		}
		game.removeVisual(comida)
		mochila = comida
	}
	
	method soltar(comida) {
		game.addVisualIn(comida, self.randomPositionInGame())
		game.whenCollideDo(comida, { entrenador => entrenador.tomarComida(comida)})
	}

	method randomPositionInGame() {
		return game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0))
	}

}

