import golosinas.*
object mariano {
    const bolsaDeGolosinas = []
    const golosinasDesechadas = []

    method comprar(unaGolosina){
        bolsaDeGolosinas.add(unaGolosina)
    }

    method desechar(unaGolosina){
        bolsaDeGolosinas.remove(unaGolosina)
        golosinasDesechadas.add(unaGolosina)
    }

    method cantidadDeGolosinas(){
        return bolsaDeGolosinas.size()
    }

    method tieneLaGolosina(unaGolosina){
        return bolsaDeGolosinas.contains(unaGolosina)
    }

    method probarGolosinas(){
        bolsaDeGolosinas.forEach({g => g.recibirMordisco()})
    }

    method hayGolosinaSinTACC(){
        return bolsaDeGolosinas.any({g=>g.esLibreDeGluten()})
    }

    method preciosCuidados(){
        return bolsaDeGolosinas.any({g=>g.precio()<=10})
    }

    method golosinaDeSabor(unSabor){
        return self.golosinasDeSabor(unSabor).first()
    }

    method golosinasDeSabor(unSabor){
        return bolsaDeGolosinas.filter({g=>g.sabor()==unSabor})
    }

    method sabores(){
        return bolsaDeGolosinas.map({g=>g.sabor()}).asSet()
    }

    method golosinaMasCara(){
        return bolsaDeGolosinas.max({g=>g.precio()})
    }

    method pesoGolosinas(){
        return bolsaDeGolosinas.sum({g=>g.peso()})
    }

    method golosinasFaltantes(golosinasDeseadas){
        return bolsaDeGolosinas.asSet().difference(golosinasDeseadas.asSet())
    }

    method gustosFaltantes(gustosDeseados){
        return self.sabores().difference(gustosDeseados)
    }

    method gastoEn(unSabor){
        return self.golosinasDeSabor(unSabor).sum({g=>g.precio()})
    }

    method cantidadDeGolosinasSabor(unSabor){
        return bolsaDeGolosinas.count({g=>g.sabor()==unSabor})
    }

    method saborMasPopular(){
        var sabores = self.sabores()
        return sabores.max({s=>self.cantidadDeGolosinasSabor(s)})
    }

    method pesoTotalSabor(unSabor){
        return bolsaDeGolosinas.filter({g=>g.sabor()==unSabor}).sum({g=>g.peso()})
    }

    method saborMasPesado(){
        var sabores = self.sabores()
        return sabores.max({s=>self.pesoTotalSabor(s)})
    }

    method comproYDesecho(unaGolosina){
        return golosinasDesechadas.contains(unaGolosina)
    }


}

