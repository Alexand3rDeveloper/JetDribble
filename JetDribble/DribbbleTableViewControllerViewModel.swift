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
    func dataDidfinishLoadingSuccessfully()
    func noInternetConnection()
}

class DribbbleTableViewControllerViewModel{
    
    var arrayOfShotsVM = [CellViewModel]()
    var delegate:DataPresentable!
    
    init(){
        self.loadFromCache()
    }
    
    private func loadFromCache() {
        do {
            let realm = try Realm()
            let shotObjects = realm.objects(Shot.self)
            for singleShot in shotObjects{
                let cellVMCellViewModel = createCellViewModel(withShot: singleShot)
                self.arrayOfShotsVM.append(cellVMCellViewModel)
            }
            
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveToCache(object:Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    private func emptyCache() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    public func loadShots() {
        AlamoWrapper.makeRequest("https://api.dribbble.com/v1/shots", method: .get, parameters: nil).responseJSON {
            response in
                switch response.result {
                case .failure(let error):
                    if (error._code == -1001) {
                        self.delegate?.noInternetConnection()
                    }
                    print("Request failed with error: \(error)")
                   
                case .success(let JSON):
                    
                  self.arrayOfShotsVM.removeAll()
                  self.emptyCache()
                  
                  if let shotsJSON = JSON as? [[String: Any]] {
                    for shotJSON in shotsJSON{
                        guard let shot = Shot(JSON: shotJSON) else{
                            continue
                        }
                        if (!shot.animated) {
                            self.saveToCache(object: shot)
                            let cellVMCellViewModel = self.createCellViewModel(withShot: shot)
                            
                            self.arrayOfShotsVM.append(cellVMCellViewModel)
                        }
                    }
                    self.delegate?.dataDidfinishLoadingSuccessfully()
                }
            }
        }
    }
    
    private func createCellViewModel(withShot shot:Shot) -> CellViewModel {
        var imageURL:String? = shot.imageHidpiURL
        if (imageURL == ""){
            imageURL = shot.imageNormalURL
        }
        
        return CellViewModel(placeHolderText:"",textFieldText:shot.text,labelText:shot.title,pictureURL:imageURL!)
    }
    
    public func getShotVM(forIndex index:Int) -> CellViewModel? {
        return arrayOfShotsVM[index]
        
    }
    
    public func getCellVMArrayCount() -> Int {
        return arrayOfShotsVM.count
    }
    
}
