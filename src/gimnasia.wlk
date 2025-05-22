class Rutina {
    const intensidad
    method descanso(tiempo)

    method caloriasQuemadas(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * intensidad
    }
}

class Running inherits Rutina{

   override method caloriasQuemadas(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * intensidad
    }

    override method descanso(tiempo) {
      return if(tiempo > 20){
        5
      } else {
        2
      }
    }
}

class Maraton inherits Running{

    override method caloriasQuemadas(tiempo){
        return super(tiempo) * 2
    }
}

class Remo inherits Rutina(intensidad = 1.3){

    override method descanso(tiempo) {
      return tiempo/5
    }

    override method caloriasQuemadas(tiempo) {
      return 100 * (tiempo - self.descanso(tiempo)) * intensidad
    }
}

class RemoDeCompeticion inherits Remo(intensidad = 1.7) {

    override method descanso(tiempo){
        return (super(tiempo) - 3).max(2)
    }

  override method caloriasQuemadas(tiempo) {
    return 100 * (tiempo - self.descanso(tiempo)) * intensidad
  } 
}

class Persona{
    var property peso = null
    const kilosPorCaloría = null
    const tiempoEjercicio = null

    method pesoPerdido(ejercicio){
        peso = peso -(ejercicio.caloriasQuemadas(tiempoEjercicio)/kilosPorCaloría)
    }
}

class PersonaSedentaria inherits Persona(kilosPorCaloría = 7000){
    
    method validarPeso(){
        if (peso < 51){
            self.error('No puede hacer ejercicio')
        }
    }

    override method pesoPerdido(ejercicio){
        self.validarPeso()
        super(ejercicio)
    }
}

class PersonaAtleta inherits Persona(kilosPorCaloría = 8000, tiempoEjercicio = 90) {
    
    method validarCalorias(ejercicio) {
        if(ejercicio.caloriasQuemadas(tiempoEjercicio) < 10000){
            self.error('Las calorías que puede quemar son menores a 10000')
        }  
    }

    override method pesoPerdido(ejercicio) {
        self.validarCalorias(ejercicio)
        peso = peso -((ejercicio.caloriasQuemadas(tiempoEjercicio)/kilosPorCaloría) - 1)
    }
}

class Club{

} 