//
//  ViewController.swift
//  JetDribble
//
//  Created by Alex on 12/16/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        POST https://dribbble.com/oauth/token
        let parameters1: Parameters = [
            "client_id": "00ef7505ad1e250b0c21a4b190bd776323bf39142429acc425eb897e818d0f28",
//            "client_id": "bar",
//            "baz": ["a", 1],
//            "qux": [
//                "x": 1,
//                "y": 2,
//                "z": 3
//            ]
        ]
//
//        // All three of these calls are equivalent
//        Alamofire.request("https://httpbin.org/post", parameters: parameters)
//        Alamofire.request("https://httpbin.org/post", parameters: parameters, encoding: URLEncoding.default)
//        , method: .post
//        var request = NSMutableURLRequest(url: NSURL(string: "YOUR URL HERE")! as URL)
//        request.httpMethod = "GET"
//        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
//        request.addValue("application/vnd.dribbble.v1.text+json", forHTTPHeaderField: "Accept")
//        //Add paramaters (Optional)
//        let param = ["foo": "bar"]
////        let encoding = Alamofire.ParameterEncoding.URL
//        (request, _) = encoding.encode(request, parameters: param)
//        Alamofire.request(request).responseJSON { response in
//            //DO SOMETHING WITH YOUR RESPONSE OBJECT
//        }
//        
        
        Alamofire.request("https://dribbble.com/oauth/authorize", parameters: parameters1, encoding: URLEncoding.default).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
//        Client ID
//        00ef7505ad1e250b0c21a4b190bd776323bf39142429acc425eb897e818d0f28
//        Client Secret • Reset
//        5618226d550f57aa75d2144c8ddaf16b3bdcc5e8b51ae0fdb43df09b1a283540
//        Client Access Token • Reset
//        ed25436f8a22c1bf3740b17362b9e1859d2e6bcff9dba2c26dbd50f6607d4774
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

