object mariano {
    const bolsaDeGolosinas = {}

    method comprar(unaGolosina){
        bolsaDeGolosinas.add(unaGolosina)
    }

    method desechar(unaGolosina){
        bolsaDeGolosinas.remove(unaGolosina)
    }

    method cantidadDeGolosinas(){
        return bolsaDeGolosinas.size()
    }

    method tieneLaGolosina(unaGolosina){
        return bolsaDeGolosinas.contains(unaGolosina)
    }

    method probarGolosinas(){
        bolsaDeGolosinas.map({g => g.recibirMordisco()})
    }

    method hayGolosinaSinTACC(){
        return bolsaDeGolosinas.any({g=>g.esLibreDeGluten()})
    }

    method preciosCuidados(){
        return bolsaDeGolosinas.any({g=>g.precio()<=10})
    }

    method golosinaDeSabor(unSabor){
        self.golosinasDeSabor(unSabor).asList().first()
    }

    method golosinasDeSabor(unSabor){
        return bolsaDeGolosinas.filter({g=>g.sabor()==unSabor})
    }

    method sabores(){
        return bolsaDeGolosinas.map({g=>g.sabor()}).asList()
    }

    method golosinaMasCara(){
        return bolsaDeGolosinas.max({g=>g.precio()})
    }

    method pesoGolosinas(){
        return bolsaDeGolosinas.sum({g=>g.peso()})
    }

    method golosinasFaltantes(golosinasDeseadas){
        return bolsaDeGolosinas.difference(golosinasDeseadas)
    }

    method gustosFaltantes(gustosDeseados){
        return self.sabores().difference(gustosDeseados)
    }

}

