import cosasParte2.*


object camion {

const carga= []
method cargar(unaCosa) {
  carga.add(unaCosa)
  unaCosa.consecuenciasDeLaCarga()
    }

method descargar(unaCosa) {
  carga.remove(unaCosa)
    }
method pesoTotal() {
    return 1000 + carga.sum({cosa=> cosa.peso()})
} 

method todoPesoPar() {
   /// return carga.all({c=>c.peso().even()})
   return carga.all({c=> c.esPesoPar()})
    }

    method algunaCosaPesa(unValor) {
        return carga.any({c=>c.peso()==unValor})
    }

    method primerCosaConPeligrosidad(unValor) {
        return carga.find({c => c.peligrosidad()==unValor})
    }
    method todasLasCosasConMasPeligrosidadQue(unValor) {
        return
        carga.filter({c => c.peligrosidad()>unValor})
    }

    method cosasSuperanPeligrosidadDe(unaCosa) {
        carga.filter ({c=> c.peligrosidad() > unaCosa.peligrosidad()})
    }
    method excedePesoMaximo() {
        return self.pesoTotal()>2500
    }

    method puedeCircular(nivelMaximo) { 
    return
      not self.excedePesoMaximo() && self.todasLasCosasConMasPeligrosidadQue(nivelMaximo).isEmpty()

    } 

    method algunaCosaPesaEntre(valorMin,valorMax) {
        return 
        carga.any({c=>c.peso().between(valorMin,valorMax)})
    } 
    method laCosaMasPesada() {
        return 
        carga.max({c=>c.peso()})
    } 
}

