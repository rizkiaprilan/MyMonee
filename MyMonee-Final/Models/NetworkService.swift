//
//  NetworkService.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 20/05/21.
//

import Foundation

class NetworkService {
    let currentUrl: String = "https://60a5fe0cc0c1fd00175f4df8.mockapi.io/api/v1/transaction"
    
    func loadHistoryData(completion: @escaping(_ transaction: [HistoryDataAPI],_ message:String?) -> Void) {
        let components = URLComponents(string: currentUrl)
        
        let request = URLRequest(url: (components?.url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                
                
                guard error == nil else {
                    completion([],"Error: error calling POST")
                    print(error!)
                    return
                }
                guard data == data else {
                    completion([],"Error: Did not receive data")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                    completion([],"Error: HTTP request failed")
                    return
                }
                guard let getAllHistory = try? decoder.decode([HistoryDataAPI].self, from: data) else {
                    return
                }
                completion(getAllHistory,nil)
            }
        }
        task.resume()
    }
    
    func loadHistoryDataById(completion: @escaping(_ transaction: HistoryDataAPI?,_ message:String?) -> Void,id:String) {
        let components = URLComponents(string: "\(self.currentUrl)/\(id)")
        
        let request = URLRequest(url: (components?.url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                
                guard error == nil else {
                    completion(nil,"Error: error calling POST")
                    print(error!)
                    return
                }
                guard data == data else {
                    completion(nil,"Error: Did not receive data")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                    completion(nil,"Error: HTTP request failed")
                    return
                }
                guard let getHistory = try? decoder.decode(HistoryDataAPI.self, from: data) else {
                    return
                }
                completion(getHistory,nil)
            }
        }
        task.resume()
    }
    
    func createHistoryData(data:HistoryData,message: @escaping(_ message:String) -> Void) {
        let components = URLComponents(string: currentUrl)
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Add data to the model
        let uploadDataModel = HistoryDataAPI(uuid: data.id, title: data.title, extensions: data.extensions.status.rawValue, price: data.price, date: data.formatDate)
        
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            message("Error: Trying to convert model to JSON data")
            return
        }
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                message("Error: error calling POST")
                print(error!)
                return
            }
            guard data != nil else {
                message("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                message("Error: HTTP request failed")
                return
            }
            message("Data Berhasil Tersimpan")
        }.resume()
    }
    
    func updateHistoryData(data:HistoryData,id:String,message: @escaping(_ message:String) -> Void) {
        let components = URLComponents(string: "\(self.currentUrl)/\(id)")
        
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Add data to the model
        let updateDataModel = HistoryDataAPI(uuid:data.id, title: data.title, extensions: data.extensions.status.rawValue, price: data.price, date:data.formatDate)
        
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(updateDataModel) else {
            message("Error: Trying to convert model to JSON data")
            return
        }
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                message("Error: error calling PUT")
                print(error!)
                return
            }
            guard data != nil else {
                message("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                message("Error: HTTP request failed")
                return
            }
            message("Data Berhasil Terupdate")
        }.resume()
    }
    
    func deleteHistoryData(id:String,message: @escaping(_ message:String) -> Void) {
        let components = URLComponents(string: "\(currentUrl)/\(id)")
        
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                message("Error: error calling DELETE")
                print(error!)
                return
            }
            guard data != nil else {
                message("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                message("Error: HTTP request failed")
                return
            }
            message("Data Berhasil Terhapus")
        }.resume()
        
    }
}
