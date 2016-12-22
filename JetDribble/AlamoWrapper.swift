//
//  AlamoWrapper.swift
//  JetDribble
//
//  Created by Alex on 12/22/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import Alamofire

class AlamoWrapper {

    static func requestWithClientID(_ url: URLConvertible,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default
                                     )
        -> DataRequest{
            let headersToken = ["Authorization": "Bearer ed25436f8a22c1bf3740b17362b9e1859d2e6bcff9dba2c26dbd50f6607d4774"]
            return Alamofire.request("https://api.dribbble.com/v1/shots", method: .get, parameters: parameters, headers: headersToken)
//
    }
    
}
