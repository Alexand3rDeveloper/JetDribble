//
//  NetworkController.swift
//  JetDribble
//
//  Created by Alex on 12/27/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation

class NetworkController {
    func getShotsFromDribbble(){
        AlamoWrapper.requestWithClientID("https://api.dribbble.com/v1/shots", method: .get, parameters: nil).responseJSON{
            response in
            if let result = response.result.value {
                print("value",response.result.value)
                
                let JSON = result as! NSArray
                print("JSON ARRAY IS",JSON[0])
            }
        }
    }
    
//    private func

    static func isAnimatedShot(dictionary:NSDictionary)->Bool{
        let result:Bool = (dictionary.object(forKey: "animated") != nil)
//        switch result {
//            case "1":
//            return true
//            case "0":
//            return false
//        default:
            return result
//        }
    }
    
    
}
