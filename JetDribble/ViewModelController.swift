//
//  ViewModelController.swift
//  JetDribble
//
//  Created by Alex on 12/26/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation
import RealmSwift

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
                  self.arrayOfShotsVM.removeAll()
                  
//                    do {
//                        let realm = try Realm()
//                        try realm.write {
//                            realm.deleteAll()
//                        }
//                        
//                    } catch let error as NSError {
//                        fatalError(error.localizedDescription)
//                    }
                    
                        if let shotsJSON = JSON as? [[String: Any]] {
                            for shotJSON in shotsJSON {
                                guard let shot = Shot(JSON: shotJSON) else {
                                    continue
                                }
                               //question is test for animation stus should be in model or in viewmodel?
                                print("shot is ",shot)
                                if (!shot.animated){
                                    var imageURL:String? = shot.imageHidpiURL
                                    if (imageURL == ""){
                                        imageURL = shot.imageNormalURL
                                    }
                                    let cellVMCellViewModel = CellViewModel(placeHolderText:"",textFieldText:shot.title,labelText:shot.text,pictureURL:imageURL!)
                                   
                                    self.arrayOfShotsVM.append(cellVMCellViewModel)
                                }
//                                do {
//                                    let realm = try Realm()
//                                    try realm.write {
//                                        realm.add(shot)
//                                    }
//                                } catch let error as NSError {
//                                    fatalError(error.localizedDescription)
//                                }
                            
                            
                            
                        }
                        self.delegate?.dataDidfinishLoadingSuccessfully()
                    }
            }
        }
    }
    
    public func getShotVM(forIndex index:Int)->CellViewModel?{
        return arrayOfShotsVM[index]
        
    }
    
    public func getCellVMArrayCount()->Int{
        return arrayOfShotsVM.count
    }
    
}
