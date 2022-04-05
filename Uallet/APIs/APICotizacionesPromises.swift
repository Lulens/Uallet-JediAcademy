//
//  APICotizacionesPromises.swift
//  Uallet
//
//  Created by Lucia Baez on 04/04/2022.
//

import Foundation
import Alamofire
import PromiseKit


extension APICotizaciones{ //puedo extender una clase en distintos archivos, pero no es necesario hacerlo en este caso, puedo hacer un class propio del archivo en el que trabajo, es lo mismo
    static func bitcoinRatePromises() -> Promise<Double> {
        return Promise { resolver in
            AF.request("http://api.coindesk.com/v1/bpi/currentprice.json").responseDecodable(of: APIBitcoinResponse.self){ response in
                    if let value = response.value {
                        let rate = value.bpi.usd.rateFloat
                        resolver.fulfill(rate) //quiero cumplir la promesa
                    } else {
                        resolver.reject(APIError.ServerError) //no cumplo la promesa, la rechaza
                    }
            }
        }
    }
    
    
    static func dolarBlueRatePromises() -> Promise<Double> {
            return Promise { resolver in
                AF.request("https://api-dolar-argentina.herokuapp.com/api/dolarblue")
                    .responseDecodable(of: APIDolarArgentinaResponse.self) {
                    response in

                        if let value = response.value {
                            if let rate = Double(value.compra) {
                                resolver.fulfill(rate)
                            } else {
                                resolver.reject(APIError.ServerError)
                            }
                        } else {
                            resolver.reject(APIError.ServerError)
                        }

                }
            }
    
   /* static func dolarBlueRatePromises() -> Promise<Double> {
        return Promise { resolver in
            AF.request("https://api-dolar-argentina.herokuapp.com/api/dolarblue")
                .responseDecodable(of: APIDolarArgentinaResponse.self){
                    response in
                
                if let value = response.value {
                    if let rate = Double(value.compra){
                            resolver.fulfill(rate)
                        } else {
                            resolver.reject(APIError.ServerError)
                        }
                    }
                } else {
                    resolver.reject(APIError.ServerError) //no cumplo la promesa
                }
            }
*/
    }
        
        
    
}
 
