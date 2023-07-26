//
//  APIManager.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 23/07/2023.
//

import UIKit
import Combine
import CoreData


protocol ApiProviderDelegate {
    func didUpdate(_ manager: APIManager, sets: LegoSetModel)
    func didFailWithError(error: Error)
}

class APIManager {

    let delegate: ApiProviderDelegate? = nil
    var saved: [LegoSetModel] = []
    
    func fetchWeatcher(setName: String) {
        let urlString =  "\(apiURL)&search=\(setName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let letoSet = self.parseJSON(safeData){
                        self.delegate?.didUpdate(self, sets: letoSet)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> LegoSetModel?{

        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(LegoSet.self, from: data)
            let legoSet: LegoSetModel
   
            legoSet = CoreDataStack.shared.createModel()
            
//           weather.cityName = decodeData.location.name
//           weather.country = decodeData.location.country
//            weather.gps = GPS
            
            
            saveLego()
            
            return legoSet
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

    
    func saveLego() {
        CoreDataStack.shared.saveContext()
    }
    
    func loadLego() {
        saved = CoreDataStack.shared.getStoredDataFromCoreData() ?? []
    }
  

}

