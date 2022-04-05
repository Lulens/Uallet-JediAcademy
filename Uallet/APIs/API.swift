//
//  API.swift
//  Uallet
//
//  Created by Lucia Baez on 29/03/2022.
//

import Foundation


enum APIError: Error{ //enumeracion que cumple con protocolo
    case UserIncomplete, PasswordIncomplete, ServerError
}


typealias CallbackLogin = (Bool)->Void

class API {
    //closure: funcion tratada como variable
    
    static func login(_ usuario:String, _ password:String, onFinished callback: (Bool)->Void) throws {
        
        guard usuario.count >= 4 else {
            throw APIError.UserIncomplete
        }

        guard password.count >= 4 else {
            throw APIError.PasswordIncomplete
        }

        
                
        if usuario == "admin" && password=="12345"{
            callback(true)
        }else{
            callback(false)
        }
    }
    

    
   /*
    func registro(usuario:String?, password:String?) throws {
        
        if let userNotNil = usuario {
            if userNotNil.count > 3 { //lo que hace el userNotNil es tomar el usuario y heredar el tipo de dato, en este caso String, pero sin el nulo
            }
            
        } else {
            // entra al else si el usuario es nil
        }
    }
    */
    
   /*
    func sumar(valores:[Int?]){
        //Es requisito que haya al menos 2 valores
        guard let valor0 = valores[0] else {
            return
        }
        guard let valor1 = valores[1] else {
            return
        }
    }
    */
}

