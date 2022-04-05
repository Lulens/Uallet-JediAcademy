//
//  HomeViewController.swift
//  Uallet
//
//  Created by Lucia Baez on 30/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    func logout() {
        UserDefaults.standard.set(false, forKey: "logueado")
        dismiss(animated: true)
    }
    
    func cerrar(){
        dismiss(animated: true){
            print("cerre la ventana")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //boton del navigation bar de arriba
        //target cual es el destino de mi boton, para pasar una funcion como parametro #selector(logout2)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .done, target: self, action: #selector(logout2))
        //cuando hablo de self me refiero a ESTE view controller, home view controller

    }

    //hago esta funcion, @objc se pone porque paso la funcion como parametro 
    @objc func logout2 () {
        
    }

}
