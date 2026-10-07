class Golosina {
    var peso
    method precio()
    method peso() = peso
    method sabor()
    method esLibreDeGluten() = false
    method recibirMordisco()
}

class Bombon inherits Golosina (peso=15){
    override method precio() = 5
    override method sabor() = frutilla
    override method esLibreDeGluten() = true
    override method recibirMordisco(){
        peso = ((peso * 0.8)-1).max(0)
    }
}

class Alfajor inherits Golosina(peso=300){
    override method precio() = 12
    override method sabor() = chocolate
    override method recibirMordisco(){
        peso = (peso * 0.8).max(0)
    }
}

class Caramelo inherits Golosina(peso=5){
    override method precio() = 1
    override method sabor() = frutilla
    override method esLibreDeGluten() = true
    override method recibirMordisco(){
        peso = (peso-1).max(0)
    }
}

class Chupetin inherits Golosina(peso=7){
    override method precio() = 2
    override method sabor() =naranja
    override method esLibreDeGluten() = true
    override method recibirMordisco(){
        if(peso>=2){
            peso = (peso*0.9).max(0)
        }
    }
}

class Oblea inherits Golosina(peso=250){
    override method precio() = 5
    override method sabor() = vainilla
    override method recibirMordisco(){
        if(peso>70){
            peso = (peso*0.5)
        } else {
            peso = (peso - peso*0.25)
        }
    }
}

class Chocolatin inherits Golosina(peso=0){
    const pesoInicial
    var gramosConsumidos = 0
    override method precio(){
        return 0.5 * pesoInicial
    }
    override method sabor()= chocolate
    override method peso()= pesoInicial - gramosConsumidos
    override method recibirMordisco(){
        gramosConsumidos += 2
    }
}

class GolosinaBaniada inherits Golosina(peso=0){
    const golosinaBase
    var pesoBaniado=4
    override method peso()=golosinaBase.peso()+pesoBaniado
    override method precio()=golosinaBase.precio()+2
    override method sabor()=golosinaBase.sabor()
    override method esLibreDeGluten()=golosinaBase.esLibreDeGluten()
    override method recibirMordisco(){
        golosinaBase.recibirMordisco()
        pesoBaniado = (pesoBaniado-2).max(0)
    }

}

class PastillaTuttiFrutti inherits Golosina(peso=5){
    const esLibreDeGluten
    var sabor = chocolate
    override method precio()= if(esLibreDeGluten) 7 else 10
    override method esLibreDeGluten() = esLibreDeGluten
    override method sabor()=sabor
    override method recibirMordisco(){
        sabor = sabor.pasarAlSiguienteSabor()
    }
}

object frutilla{
    method pasarAlSiguienteSabor()= chocolate
}

object chocolate{
    method pasarAlSiguienteSabor()= naranja
}

object naranja{
    method pasarAlSiguienteSabor()= frutilla
}

object vainilla {
  
}


object melon {
  
}
