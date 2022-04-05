//
//  APICotizaciones.swift
//  Uallet
//
//  Created by Lucia Baez on 04/04/2022.
//

import Foundation
import Alamofire

//cualqueir cosa que tenga q ver con la UI no tiene que estar en este archivo
class APICotizaciones{
    
    static func getBitcoinRate( callback: @escaping (Bool, Double?)->Void ){     //siempre que recibimos un callback y llamamos a otro callback                                                              tenemos que pedirle que se escape por eso @escaping
        AF.request("http://api.coindesk.com/v1/bpi/currentprice.json").responseDecodable(of:APIDolarRespuesta.self){ response in
            if let value = response.value{
                let rate = value.bpi.usd.rateFloat
                callback(true, rate)
            } else {
                callback(false, nil)
            }

            
        }
    }
    
    
    
}
