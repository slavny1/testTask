//
//  DataManager.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 30/05/24.
//

import Foundation

class DataManager {
    func getData(completion: @escaping ([JobModel]?) -> Void) {

        guard let url = URL(string: "https://someurl.com/") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                completion(nil)
                return
            }

            // Check if data is available
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let jobs = try decoder.decode([JobModel].self, from: data)
                completion(jobs)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

