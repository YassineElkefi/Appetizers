//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 20/10/2025.
//

import Foundation

final class NetworkManager{
    
    static let shared = NetworkManager()
    
    static let baseURL = "http://192.168.1.3:3000/api/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init(){}
    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void){
//        
//        //Check if the URL Works
//        guard let url = URL(string: appetizerURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        // Creating the data task
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            
//            //Check if there's an error
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            //Checking the response status
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            //Checking the data
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            //Decoding the data
//            do{
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            }catch{
//                completed(.failure(.invalidData))
//            }
//            
//        }
//        task.resume()
//    }
    
    func getAppetizers() async throws ->  [Appetizer] {
        
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
    
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        }catch{
            throw APError.invalidData
        }
    }
}
