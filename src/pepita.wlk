import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	method image() = 
		if (self.energia() > 100){
			"pepita-gorda-raw.png"
		}
		else{
			"pepita.png"
		}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
		else{
			game.say(self, "Ya estoy en!")
		}
	}
	method volaYCome(comida){
		game.removeVisual(comida)
		self.move(comida.position())
		self.come(comida)
	}
	
	
	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		if (self.alcanzaLaEnergia(nuevaPosicion)){
			energia -= self.calcularEnergiaDeVuelo(nuevaPosicion)
			self.position(nuevaPosicion)
		}
		else{
			game.say(self, "Dame de comer primero!")
		}
	}
	method alcanzaLaEnergia(nuevaPosicion){
		return self.energia() > self.calcularEnergiaDeVuelo(nuevaPosicion)
	}
	method calcularEnergiaDeVuelo(nuevaPosicion){
		return self.energiaParaVolar(position.distance(nuevaPosicion))
	}	
}
