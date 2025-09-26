import camiondetransporte-kevinbrandan496.camion.*
import camionParte2.*
import cosasParte2.*


describe "camion test" {
/*method initialize(){//sirve para iniciar un metodo de una determinada forma
camion.cargar(knightRider)
camion.cargar(arena)
arena.peso(200)
ladrillos.cantidad(10)
camion.cargar(ladrillos)
}*/
  test "el camion tiene un peso total de 1720" {
    camion.cargar(knightRider)
    camion.cargar(arena)
    arena.peso(200)
    camion.cargar(ladrillos)
  }

  test"puede circular el camion" {
    assert.that(camion.puedeCircular(10))
  }

}

