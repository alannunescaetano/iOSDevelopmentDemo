//
//  ShareProfileToWebHookService.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 12/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import Foundation

class ShareProfileToWebHookService {
    
    private let _webHookURL = "https://webhook.site/1a72abae-a2a8-4403-9331-ea3ac5f73e30"
    
    func shareProfile(person:Person, completion: @escaping(Bool) -> ()) {
        do {
            var urlRequest = URLRequest(url: URL(string: _webHookURL)!)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(person)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        completion(false)
                        return
                }
                
                completion(true)
            }
            dataTask.resume()
        } catch {
            completion(false)
        }
    }
}
