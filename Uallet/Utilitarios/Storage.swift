//
//  Storage.swift
//  Uallet
//
//  Created by Lucia Baez on 31/03/2022.
//

import Foundation

class Storage {
    
    func grabar(){
        let defaults = UserDefaults.standard //singleton -> patron de diseño que garantiza que haya una sola instancia de algo
        defaults.set(365, forKey: "cantidad_dias") //para grabar necesito un "set", si quiero grabar un numero va primer y , el                                             forKey es el nombre de la variable
    }
    
    func leer (){
        let defaults = UserDefaults.standard
        _ = defaults.integer(forKey: "cantidad_dias") //para trar un dato, usamos el sustantivo de lo que me va a                                                       traer, como en este caso es un numero uso el .integer y en                                                      el forKey pongo el nombre de la variable que quiero traer
    }
}
/*
enum ErrorDistancia{
    case Punto1Negativo, Punto2Negativo
}

func distancia(_ punto1: Int, _ punto2: Int) throws -> Int {
    guard punto1 <= 0 else {
        throw ErrorDistancia.Punto1Negativo
    }
    guard punto2 <= 0 else {
        throw ErrorDistancia.Punto2Negativo
    }
    
    return punto2-punto1
}
 */
