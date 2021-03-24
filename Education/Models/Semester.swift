//
//  SemesterSevenData.swift
//  Education
//
//  Created by Admin on 3/15/21.
//

import Foundation

struct Semester: Codable {
    var id: Int
    var name: String
    var lesson: [Lesson]?
    var lessonClassTypes: [LessonClassType]?
}

struct Lesson: Codable {
    var id: Int
    var name: String?
    var data: [LessonData?]?
    
    static func randomData() -> [Lesson] {
        return [
            .init(id: UUID().hashValue, name: Bool.random() ? "Электрохимия" : "Математика", data: [
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30)
            ]),
            .init(id: UUID().hashValue, name: "Основы химического анализа", data: [
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30)
            ]),
            .init(id: UUID().hashValue, name: "Иностранный язык", data: [
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30),
                Bool.random() ? nil : .init(totalHours: Int.random(in: 1...30), plannedHours: 30)
            ])
        ]
    }
}

struct LessonClassType: Codable {
    var name: String // Лекция, Лаба, ...
}

struct LessonData: Codable {
    var totalHours: Int?
    var plannedHours: Int?
}
