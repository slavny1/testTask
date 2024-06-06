//
//  MainViewModel.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 06/06/24.
//

import Foundation

class MainViewModel: ObservableObject {

    @Published var vacancies: [Vacancy] = []

    private let url = URL(string: "https://run.mocky.io/v3/d67a278f-ddcb-438c-bf56-3194c529b12b")!

    init() {
        fetchData()
    }

    private func fetchData() {
        Task {
            do {
                let vacancies: [Vacancy] = try await fetchData(from: url)
                DispatchQueue.main.async {
                    self.vacancies = vacancies
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }

    func fetchData(from url: URL) async throws -> [Vacancy] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(Vacancies.self, from: data)
        return decodedData.vacancies
    }

}
