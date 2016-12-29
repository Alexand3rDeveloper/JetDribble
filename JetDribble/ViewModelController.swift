//
//  ViewModelController.swift
//  JetDribble
//
//  Created by Alex on 12/26/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation

protocol DataPresentable {
//    var something:String ? {get set}
    func dataDidfinishLoadingSuccessfully()
    
}

//protocol
class ViewModelController{
    
    var arrayOfShotsVM = [CellViewModel]()
    var delegate:DataPresentable!
    
    init(){
//        self.delegate
//        arrayOfShotsVM
        
    }
    
    public func loadtheShots(){
        AlamoWrapper.requestWithClientID("https://api.dribbble.com/v1/shots", method: .get, parameters: nil).responseJSON{
            response in
                switch response.result {
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    
                case .success(let JSON):
                    if let result = response.result.value{
                        
                        print("value",response.result.value)
                        
                        let resultsArray = result as! NSArray
                        print("JSON ARRAY IS",resultsArray[0])
                        for resultObject in resultsArray {
                            let resultObjectDictionary: NSDictionary = resultObject as! NSDictionary
                            
                            if NetworkController.isAnimatedShot(dictionary:resultObjectDictionary) == false{
                                print("resultObject IS",resultObject)
                            }
                            
                        }
                        self.delegate?.dataDidfinishLoadingSuccessfully()
                    }
            }
        }
    }
    
    public func getShotVM(forIndex index:Int)->CellViewModel?{
        return nil
        
    }
    
}
