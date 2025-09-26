object knightRider {
    method peso()=500
    method peligrosidad() =10
    method esPesoPar() {
        return self.peso().even()
    }
    method bultos() = 1
    method consecuenciasDeLaCarga() {
        ///no hace nada
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

        method bultos() = 2

      method consecuenciasDeLaCarga() {
        self.transformateenRobot()
    } 


}

object ladrillos {
  var cantidad =10

  method cantidad(nuevaCantidad) {
    cantidad=nuevaCantidad.max(0)
  }

  
  method peso() {
   return 2*cantidad
  } 
  method peligrosidad() = 2

   method esPesoPar() {
        return self.peso().even()
    }
    method bultos() { return
        if(cantidad<=100){1}
        else if(cantidad.between(101, 200)){2}
        else {3}
    } 
    method consecuenciasDeLaCarga() {
      cantidad=cantidad+12
    }
}

object arena {
var property peso=0 

  method peligrosidad() = 1

   method esPesoPar() {
        return self.peso().even()
    }
        method bultos() = 1

 method consecuenciasDeLaCarga(){
    peso=(peso-10).max(0)
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

  method bultos() = if(estaConMisiles) 2 else 1

  method consecuenciasDeLaCarga(){
    self.cargarMisiles()
  }
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

    method bultos() =  1+cosasAdentro.sum({c=>c.bultos()})

    method consecuenciasDeLaCarga(){ 
        if(cosasAdentro.isEmpty())
        cosasAdentro.forEach({c=>c.consecuenciasDeLaCarga()})///el for each pasa una accion a cada cosa de una lista
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
        method bultos() = 1
 method consecuenciasDeLaCarga(){
    peso=peso+15
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

 method bultos() = 2
 method consecuenciasDeLaCarga(){
    
 }

}

