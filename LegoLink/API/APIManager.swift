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
    func didUpdate(_ manager: APIManager, sets: [LegoSetModel])
    func didFailWithError(error: Error)
}

class APIManager {

    var delegate: ApiProviderDelegate?
    var saved: [LegoSetModel] = []
    
    func fetchSets(setName: String) {
        let urlString =  "\(ApiKey.url)&search=\(setName)"
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
    func parseJSON(_ data: Data) -> [LegoSetModel]? {

        let decoder = JSONDecoder()
        var legoArr: [LegoSetModel] = []
        do {
            let decodeData = try decoder.decode(PageResponse<LegoSet>.self, from: data)
            decodeData.results.forEach { lego in
                
                
                //            let lego = decodeData.results[0]
                let legoSet: LegoSetModel
                
                legoSet = CoreDataStack.shared.createModel()
                
                legoSet.name = lego.name
                legoSet.themeID = Int16(lego.theme_id ?? 0)
                legoSet.numParts = Int16(lego.num_parts)
                legoSet.year = Int16(lego.year ?? 1990)
                legoSet.setImageURL = lego.set_img_url
                legoSet.setNum = lego.set_num
                legoSet.setURL = lego.set_url
                
                legoSet.data = Int32(Date().timeIntervalSince1970)
                
                legoArr.append(legoSet)
//                saveLego()
//                return legoSet    
            }
            return legoArr
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

