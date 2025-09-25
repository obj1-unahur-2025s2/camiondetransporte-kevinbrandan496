object knightRider {
    method peso()=500
    method peligrosidad() =10
    method esPesoPar() {
        return self.peso().even()
    }
    
}

object bumblebee {
  var esAuto=true

  method peso() = 800

  method transformateEnAuto() {
    esAuto=true
  }
  method transformateenRobot() {
    esAuto=false
  } 

  method peligrosidad() = if(esAuto) 15 else 30

   method esPesoPar() {
        return self.peso().even()
    }
}

object ladrillos {
  var cantidad =10

  method cantidad(nuevaCantidad) {
    cantidad=nuevaCantidad
  }
  method peso() {
   return 2*cantidad
  } 
  method peligrosidad() = 2

   method esPesoPar() {
        return self.peso().even()
    }
}

object arena {
var property peso=0 

  method peso() {
    return peso
  }

  method peligrosidad() = 1

   method esPesoPar() {
        return self.peso().even()
    }
}

object bateriaAntiaerea {
  var estaConMisiles= false
  method cargarMisiles() {
    estaConMisiles=true
  }
  method descargarMisiles() {
    estaConMisiles=false
  }
   method esPesoPar() {
        return self.peso().even()
    }

  method peso() =if(estaConMisiles) 300 else 200
  method peligrosidad() = if(estaConMisiles)100 else 0
}

object contenedor {
  const cosasAdentro = []
  method agregar(unaCosa) {
    cosasAdentro.add(unaCosa)
  }
  method agregarVarias(variasCosas) {
    cosasAdentro.addAll(variasCosas)
  }

  method quitarCosa(unaCosa) {
    cosasAdentro.remove(unaCosa)
  }

  method quitarTodas(variasCosas) {
    cosasAdentro.removeAll(variasCosas)
  }
  method peso() {
    return 100+ cosasAdentro.sum({cosa=>cosa.peso()})
  }

  method peligrosidad() {
    return  if(cosasAdentro.isEmpty()) 0 
    else cosasAdentro.max({cosas=>cosas.peligrosidad()}).peligrosidad()///el clousure con el max devuelve un objeto y le tenes que conultar la peligrosidad
  }
   method esPesoPar() {
        return self.peso().even()
    }
}

object residuos {
  var property peso = 0
  method peligrosidad() {
    return 200
  }
   method esPesoPar() {
        return self.peso().even()
    }
}

object embalaje {
  var cosaEnvuelta=arena

  method envolver(unaCosa) {
    cosaEnvuelta=unaCosa
  }

  method peso() {
    return cosaEnvuelta.peso()
  }

  method peligrosidad() {
    return cosaEnvuelta.peligrosidad()/2
  }
   method esPesoPar() {
        return self.peso().even()
    }
}

