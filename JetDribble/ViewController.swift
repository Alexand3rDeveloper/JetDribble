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

 
        let headers = ["Authorization": "Bearer ed25436f8a22c1bf3740b17362b9e1859d2e6bcff9dba2c26dbd50f6607d4774"]
        let parametersShot = ["animated":"false"]
        Alamofire.request("https://api.dribbble.com/v1/shots", method: .get, parameters: parametersShot, headers: headers).responseJSON{
            response in
            
            print("data is ",response.data)
            print("response is ",response)
            print("results are: ",response.result)
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

