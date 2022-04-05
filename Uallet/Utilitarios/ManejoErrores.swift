//
//  ManejoErrores.swift
//  Uallet
//
//  Created by Lucia Baez on 04/04/2022.
//

import Foundation

enum ErrorDistancia: Error {
    case Punto1Negativo, Punto2Negativo
}

func distancia (_ punto1: Int, _ punto2: Int) throws -> Int{ //le digo que esta func va a tirar algo
    
    //EXCEPCION -> situacion especial donde el codigo me dice que no puede hacer lo que le pido. Cuando haces la func y no podes cumplir con la responsabilidad de lo que hace esa funcion por culpa de los paramentros de entrada
    guard punto1 > 0 else {
        throw ErrorDistancia.Punto1Negativo//tiro un error
    }
    
    guard punto2 > 0 else {
        throw ErrorDistancia.Punto2Negativo
    }
    
    
    return punto2-punto1
}

//-------
/*
func prueba(){
    var x = try? distancia(2, 3)
    
    do {
        x = try distancia(2, 3)
        print(x)
    } catch (ErrorDistancia.Punto1Negativo) {
        print("El punto 1 es negativo")
    } catch (ErrorDistancia.Punto2Negativo) {
        print("El punto 2 es negativo")
    } catch {
        print("")
    }
 
}*/
