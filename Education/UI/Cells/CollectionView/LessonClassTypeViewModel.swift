//
//  LessonClassTypeViewModel.swift
//  Education
//
//  Created by Admin on 20.03.2021.
//

import Foundation

protocol LessonClassTypeViewModelProtocol: AnyObject {
    var header: String { get }
    var lessonData: [LessonData?] { get}
}

final class LessonClassTypeViewModel: LessonClassTypeViewModelProtocol {
    
    var lessonData: [LessonData?]
    var header: String
    required init(lessonData: [LessonData?], header: String) {
        self.lessonData = lessonData
        self.header = header
    }
}
