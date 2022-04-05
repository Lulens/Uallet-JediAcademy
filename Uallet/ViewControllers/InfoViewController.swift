//
//  InfoViewController.swift
//  Uallet
//
//  Created by Lucia Baez on 30/03/2022.
//

import UIKit
import Alamofire
import PromiseKit

/*
struct APIDolarRespuesta: Codable { //es como una clase pero no tiene herencia y se pasan por valor, no por referencia
    var disclaimer: String //no pongo las otras variables como bpi, dolar, etc, como es codable, se matchean mis variables con el json
    
}
*/

class InfoViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leerCotizacion()
    }
    
    
    @IBOutlet weak var lblCotizaciones: UILabel!
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    @IBAction func refresh(_ sender: Any) {
        leerCotizacion()
    }
    
    
    func leerCotizacion(){
        lblCotizaciones.text = ""
        activityLoader.startAnimating()
        
        firstly {
            when(fulfilled: APICotizaciones.bitcoinRatePromises(), APICotizaciones.dolarBlueRatePromises()) // ... es un parametro que acepta multiples valores con ,
        }
        .done { rates in
            // se ejecuta done cuando se cumplan las dos promesas
            self.lblCotizaciones.text =
              """
               1 USD = \(rates.1) ARS
               1 BTC = \(rates.0) USD
             
             """
        }
        .catch { error in
            self.lblCotizaciones.text = "Error 😬"
        }
        .finally{
            self.activityLoader.stopAnimating()
        }
        
        
        APICotizaciones.bitcoinRatePromises()
            .done { rate in
                // se cumplió
            }
            .catch { error in
                // no se cumplió
                
            }
        
    }
    
    /*
        func leerCotizacionsSinPromesa(){

            lblCotizaciones.text = ""
            activityLoader.startAnimating()
            
            APICotizaciones.dolarBlueRate { ok, rateUSD in
                APICotizaciones.bitcoinRate{ ok, rateBTC in
                    self.activityLoader.stopAnimating()
                    if(ok){
                        self.lblCotizaciones.text =
                        """
                        1 USD = \(rateUSD!) ARS
                        1 BTC = \(rateBTC!) USD
                        
                        
                        """//el rate podria ser nulo por eso ponemos rate!
                    } else {
                        self.lblCotizaciones.text = "Error 😬"
                    }
                    
                }
            }
     
        }*/
          
}

    




