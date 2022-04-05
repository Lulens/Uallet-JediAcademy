//
//  APICotizacionesPromises.swift
//  Uallet
//
//  Created by Lucia Baez on 04/04/2022.
//

import Foundation
import Alamofire
import PromiseKit

extension APICotizaciones{ //puedo extender una clase en distintos archivos
    static func bitcoinRatePromises() -> Promise<Double> {
        
        return Promise { resolver in
            
            AF.request("http://api.coindesk.com/v1/bpi/currentprice.json").responseDecodable(of: APIBitcoinResponse.self){ response in
                
                if let value = response.value {
                    let rate = value.bpi.usd.rateFloat
                    resolver.fulfill(rate) //quiero cumplir la promersa
                } else {
                    resolver.reject(APIError.ServerError) //no cumplo la promesa
                }
            }
        }
    }
    
    static func dolarBlueRatePromises() -> Promise<Double> {
        
        return Promise { resolver in
            
            AF.request("http://api-dolar-argentina.herokuapp.com/aoi/dolarblue").responseDecodable(of: APIDolarArgentinaResponse.self){ response in
                
                if let value = response.value {
                    let rateCompra = Double(value.compra),
                        let rateVenta = Double(value.venta){
                            let rate = DolarRate(compra: rateCompra, venta: rateVenta)
                            resolver.fulfill(rate)
                        } else {
                            resolver.reject()
                        }
                    let rate = value.bpi.usd.rateFloat
                    resolver.fulfill(rate) //quiero cumplir la promersa
                } else {
                    resolver.reject(APIError.ServerError) //no cumplo la promesa
                }
            }
        }
        
        
    }
}
