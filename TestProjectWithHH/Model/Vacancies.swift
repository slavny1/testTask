//
//  JobModel.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 30/05/24.
//

import Foundation
import SwiftData

@Model
final class Favourite {
    @Attribute (.unique) var id: String

    init(id: String) {
        self.id = id
    }
}

// MARK: - Job
struct Vacancies: Codable {
    let vacancies: [Vacancy]
}

// MARK: - Vacancy
struct Vacancy: Codable, Hashable {

    internal func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Vacancy, rhs: Vacancy) -> Bool {
        return lhs.id == rhs.id
    }
    

    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

// MARK: - Address
struct Address: Codable {
    let town, street, house: String
}

// MARK: - Experience
struct Experience: Codable {
    let previewText, text: String
}

// MARK: - Salary
struct Salary: Codable {
    let full: String
    let short: String?
}
