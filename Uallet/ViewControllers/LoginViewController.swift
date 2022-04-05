//
//  ViewController.swift
//  Uallet
//
//  Created by Lucia Baez on 25/03/2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //de esta forma cuando el usuario entra a la app entra directamente SIN animacion al home
    override func viewDidAppear(_ animated:Bool) {
        if UserDefaults.standard.bool(forKey: "logueado"){
            irAHome(animated: true)
        }
    }

    
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var contra: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //se va el teclado
        return true
    }
    
    @IBAction func tocoFondo(_ sender: Any) {
        nombre.resignFirstResponder()
        contra.resignFirstResponder()
    }
    
    fileprivate func irAHome(animated isAnimated: Bool = true) { //fileprivate es privado para la clase y a otras clases que hayan en el archivo
        let tabVC = MainTabViewController()
        tabVC.modalTransitionStyle = .coverVertical
        tabVC.modalPresentationStyle = .fullScreen
        present(tabVC, animated: isAnimated)
        
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "logueado")
    }
    
    @IBAction func login(_ sender: Any) {
        
        do{
            //como es una funcion estatica la invoco con el nombre de la clase directamente
            try API.login(nombre.text!, contra.text!) { logueado in
                
                if logueado {
                    irAHome()
                        
                    } else {
                        alertaError("Error en los datos de ingreso. Intente nuevamente.")
                    }
            }
        } catch APIError.UserIncomplete {
            alertaError("No se ingresó el usuario")
        } catch APIError.PasswordIncomplete {
            alertaError("No se ingresó la contraseña")
        } catch { //es un finally
            alertaError("Error desconocido")
        }
        
        func alertaError(_ mensaje:String){
            let alerta = UIAlertController(title: "Log in",
                                           message: mensaje,
                                           preferredStyle: .alert)
            let botonOk = UIAlertAction(title: "Aceptar", style: .default)
            
            alerta.addAction(botonOk)
            present(alerta, animated: true)
        }
        
    }
  
}


