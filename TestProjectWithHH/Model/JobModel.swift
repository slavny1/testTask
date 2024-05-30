//
//  JobModel.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 30/05/24.
//

import Foundation

struct JobModel: Hashable, Codable {
    let name: String
    let location: String
    let salary: String
    let companyName: String
    let experience: String
    let publishDate: String

    enum CodingKeys: String, CodingKey {
        case name
        case location
        case salary
        case companyName
        case experience
        case publishDate
    }
}

let someJobs: [JobModel] = [
    JobModel(name: "Job title", location: "Napoli", salary: "10000", companyName: "Apple", experience: "5 - 10", publishDate: "20-05-2024"),
    JobModel(name: "Job title2", location: "Moscow", salary: "1000", companyName: "HH", experience: "1 - 2", publishDate: "25-05-2024"),
    JobModel(name: "Job title3", location: "Berlin", salary: "5000", companyName: "Microsoft", experience: "3", publishDate: "21-05-2024"),
]
