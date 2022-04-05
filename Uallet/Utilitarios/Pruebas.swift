//
//  Pruebas.swift
//  Uallet
//
//  Created by Lucia Baez on 04/04/2022.
//

import Foundation

// ARCHIVO DE NOTAS

//declaracion de tipos
typealias Entero = Int

class x {
    
}

struct A {
    
}

protocol P {
    
}

enum E {
    
}

func f(){
    
}


//diferencia entre clase y estructuras
class Customer{
    var id: Int
    var name: String
    var description: String?
    
    internal init(id: Int, name: String) { //command+click sobre class customer y generate memberwise initializer
        self.id = id
        self.name = name
    }
}

struct Product { //se las trata como valores. cuando usamos structs y retornnamos estructuras o intancias de ellas, las estructuras se pasan por valor, no por referencia. No hay cadena de herencia ni necesito inicializadores
    var id: Int
    var name: String
    var price: Double
}

func agregarDescripcion(_ c: Customer){ //c no es customer1 sino una copia
    c.description = "\(c.name). ID: \(c.id)"
}

func pruebaStructs(){
    
    let product1 = Product(id: 1, name: "Coca Cola", price: 150)
    print(product1)
    
    let customer1 = Customer(id: 3, name: "")
    agregarDescripcion(customer1)
    print(customer1.description ?? "sin descripcion")
    //cuando tengo los ?? significa que si de un lado es nil entonces retrono lo del otro lado
}

// por consola nos va a devolver A. ID = 3
// cuando paso un objeto (instancia de clase) por parametro se pasa por referencia, entonces adentro de esa funcion pueedo modificar al objeto


