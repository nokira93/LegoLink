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
    func didUpdate(_ manager: APIManager, sets: LegoSet)
    func didFailWithError(error: Error)
}

class APIManager {

    let delegate: ApiProviderDelegate?
    var saved: [LegoSet] = []
    
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
    
    func parseJSON(_ data: Data) -> LegoSet?{

        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(LegoSet.self, from: data)
            let legoSet: LegoSet

            legoSet = CoreDataStack.shared.createrWeatherModel()
            
           weather.cityName = decodeData.location.name
           weather.country = decodeData.location.country
            weather.gps = GPS
            
            let data = CoreDataStack.shared.createWeatherData()
            data.parentCategory = weather
            data.isDay = Int16(decodeData.current.is_day)
            let icon = decodeData.current.condition.icon.dropLast(4)
            data.icon = String(icon.dropFirst(35))
            data.temperature = decodeData.current.temp_c
            
            savedCity()
            
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    private func getGPSLocation() -> WeatherModel?{
            let locations = CoreDataStack.shared.getStoredDataFromCoreData()
            return locations?.first(where: {$0.gps})
       }
    
    func savedCity() {
        CoreDataStack.shared.saveContext()
    }
    
    func loadCity() {
            saved = CoreDataStack.shared.getStoredDataFromCoreData() ?? []
    }
  

}

