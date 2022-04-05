//
//  WalletsStorage.swift
//  Uallet
//
//  Created by Lucia Baez on 05/04/2022.
//

import Foundation

class WalletsStorage { //voy a necesitar inicializadores, a los arrays si o si hay que ponerle el tipo asi el compilador sabe que voy a meter ahi despues
    var wallets: [Wallet] = []
    
    //singleton patron de diseño q permite q un objeto tenga una sola instancia
    static var shared = WalletsStorage()
    
    init(){
        //fake wallets
        wallets.append(Wallet(name: "Ualá", balance: 30000, currency: .Pesos))
        wallets.append(Wallet(name: "Francés", balance: 6000, currency: .Dollar))
        wallets.append(Wallet(name: "Belo", balance: 200, currency: .Bitcoin))
    }
}
