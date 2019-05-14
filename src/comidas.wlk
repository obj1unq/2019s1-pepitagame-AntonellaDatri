import wollok.game.*
import pepita.*
class Manzana {
	method image() = "manzana.png"
	method position() = game.at(5,1)
	method energia() = 80
	method teEncontroRoque(){}
	method teEncontroPepita(){
	pepita.come(self)
}
}
class Alpiste {
	var property cantAlpiste
	method image() = "alpiste.png"
	method position() = game.at(5,5)
	method energia() = 0.5 * cantAlpiste
	method teEncontroRoque(){}
	method teEncontroPepita(){
	pepita.come(self)
	}
	method seSoltadaPor(entrenador){
		self.cantAlpiste(entrenador.cantAlpiste())
		entrenador.cantAlpiste(0)
	}

}
