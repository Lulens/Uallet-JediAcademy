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
        
        func leerCotizacion(){
            AF.request("http://api.coindesk.com/v1/bpi/currentprice.json").responseDecodable(of: APIDolarRespuesta.self ) {
                response in//le agrego self porque paso por parametro una clase o tipo de dato
                
                if let value = response.value {
                    let rate = value.bpi.usd.rateFloat
                    print("El bitcoin vale \(rate)")
                    
                }
                
            }
        }
        
        
        
        
        
        
        //--- MANERA DESPROLIJA DE TRATAR JSON, A MANO ---
        func leerCotizacionAMano () {
            AF.request("http://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { http in //response es una funcion y despues entre los {} tenemos una closure (que es una especie de callback)
                //responseJSON toma todo como un archivo JSON
                //response.Data procesa la respuesta como un tipo de dato Data -> es un array de bytes en memoria
                //debugPrint(http.response) //puedo acceder a distintas cosas
                

                if let body = http.value{ //body no sabemos si es opcional o no, si entra en el in no es opcional, si entra en el else si es opcional
                                          //el body es ANY
                    if let json = body as? [String: Any] {//le digo que trate al json como un diccionario de strings como clave y any como valor, el ? del as refiere a que puede ser nulo
                        let disclaimer = json["disclaimer"] as! String //disclaimer es de tipo ANY, entonces casteo el json como un string, suponiendolo nulo (as?) o suponiendolo no nulo (as!)
                        debugPrint(disclaimer)

                        let bpi = json["bpi"] as! [String: Any] //el bpi lo estoy casteando a json, que es en definitiva, un diccionario
                        let usd = bpi["usd"] as! [String: Any]
                        let rate = usd["rate_float"] as! Double
                        print("El bitcoin vale \(rate)")
                    }
                } else {
                    print("no hay body")
                }
            }
        }
        
        
        
        
        
        
        
        

/*
        @IBOutlet weak var lblCotizaciones: UILabel!
        
        
        
        @IBOutlet weak var activityLoader: UIActivityIndicatorView!
        
        
        @IBAction func refresh(_ sender: Any) {
            leerCotizacion()
        }
        
        func leerCotizacion(){
            
            
            lblCotizaciones.text = ""
            activityLoader.startAnimating()
            
            firstly {
                when(fullfilled:
                        APICotizaciones.bitcoinRatePromises(),
                        APICotizaciones.dolarBlueRatePromises())
            }
            .done{ rates in
                //cuando se cumplen las dos promesas
                self.lblCotizaciones.text =
                    """
                    1 BTC = \(rate.0)USD
                    1 USD = \(rate.1)ARS
                    """
            }
            .catch { error in
                self.lblCotizaciones.text = "Error"
            }
            .finally {
                self.activityLoader.stopAnimating()
            }
            

            
            //API en secuencia
            APICotizaciones.dolarBlueRate {ok, rate in
                APICotizaciones.getBitcoinRate { ok, rate in
                    self.activityLoader.stopAnimating()
                    if (ok){
                        self.lblCotizaciones.text = "1 BTC = \(rate)"
                    } else {
                        self.lblCotizaciones.text = "Error 😬"
                    }
                }
            }
            
            
        }
        
        
       func leerCotizacionAMano(){
            AF.request("https://httpbin.org/get").response { http in //response es una funcion que recibe un parametro, en vez de poner los parentesis, pongo directamente la funcion
                
                if let body = http.value { //body no es opcional, si fuese opcional estaria en el else
                    debugPrint(body)
                } else {
                    print("No hay body")
                }
            }
            
            AF.request("https://uala.com.ar").responseJSON { http in //response es una funcion que recibe un parametro, en vez de poner los parentesis, pongo directamente la funcion
                
                if let body = http.value { //ahora el body es Any
                    if let json = body as? [String : Any]{ //disclaimer es clave en la api
                        let disclaimer = json["disclaimer"] as!
                        debugPrint(disclaimer)
                        
                        let bpi = json["bpi"] as! [String: Any] // el ? acepta que no se puesa castear y q sea nil
                                                                // el ! solo aceptamos que existe y se puese castear
                        let usd = bpi["USD"] as! [String: Any]
                        let rate = usd["rate_float"] as! Double
                        print("El bitcoin vale $\(rate)")
                    }
                } else {
                    print("No hay body")
                }
            }
       }
        
 */

    }




