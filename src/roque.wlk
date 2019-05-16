import wollok.game.*
import comidas.*
import pepita.*

object roque {

	var property cantAlpiste = 0
	var property position = game.at(6, 4)

	method image() = "jugador.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
		self.tomarAlpiste()
	}

	
	//method alimentar(ave){
	//	if (mochila != null) {
	//		ave.come(mochila)
	//		self.soltar(mochila)
	//		mochila = null
	//	}
	//}
	//method tomarComida(comida) {
	//	if (mochila != null) {
	//		self.soltar(mochila)
	//	}
	//	game.removeVisual(comida)
	//	mochila = comida
	//}
	
	//method soltar(comida) {
	//	game.addVisualIn(comida, self.position())
	//	
	//}
	method soltar(comida) {
		comida.seSoltadaPor(self)
		game.addVisualIn(comida, self.position())	
	}

	//method randomPositionInGame() {
	//	return game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0))
	//}
	method teEncontroPepita(){
		game.say(self, "Hola, Pepita")
	}
	method come(comida) {
	}
	method tomarAlpiste(){
		cantAlpiste += 1
	}
}

