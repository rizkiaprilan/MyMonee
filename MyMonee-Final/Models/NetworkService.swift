//
//  NetworkService.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 20/05/21.
//

import Foundation

class NetworkService {
    let currentUrl: String = "https://60a5fe0cc0c1fd00175f4df8.mockapi.io/api/v1/transaction"
    
    func loadHistoryData(completion: @escaping(_ transaction: [HistoryDataAPI]) -> Void) {
        let components = URLComponents(string: currentUrl)
        
        let request = URLRequest(url: (components?.url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data {
                let decoder = JSONDecoder()
                
                let getAllHistory = try! decoder.decode([HistoryDataAPI].self, from: data)
                completion(getAllHistory)
            }
        }
        task.resume()
    }
    
    func loadHistoryDataById(completion: @escaping(_ transaction: HistoryDataAPI) -> Void,id:String) {
        let components = URLComponents(string: "\(currentUrl)/\(id)")
        
        let request = URLRequest(url: (components?.url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                
                let getAllHistory = try! decoder.decode(HistoryDataAPI.self, from: data)
                completion(getAllHistory)
            }
        }
        task.resume()
    }
    
    func createHistoryData(data:HistoryData) {
        var components = URLComponents(string: currentUrl)
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Add data to the model
        let uploadDataModel = HistoryDataAPI(uuid: data.id, title: data.title, extensions: data.extensions.status.rawValue, price: data.price, date: data.formatDate)
        
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Couldn't print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
        task.resume()
    }
    
    func updateHistoryData(data:HistoryData,id:String) {
        let components = URLComponents(string: "\(currentUrl)/\(id)")
        
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Add data to the model
        let updateDataModel = HistoryDataAPI(uuid:data.id, title: data.title, extensions: data.extensions.status.rawValue, price: data.price, date:data.formatDate)
        
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(updateDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling PUT")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    func deleteHistoryData(id:String) {
        let components = URLComponents(string: "\(currentUrl)/\(id)")
        
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling DELETE")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
        
    }
}
