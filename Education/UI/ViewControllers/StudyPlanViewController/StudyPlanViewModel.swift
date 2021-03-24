//
//  StudyPlanViewModel.swift
//  Education
//
//  Created by Admin on 19.03.2021.
//

import UIKit

protocol StudyPlanViewModelProtocol: AnyObject, UITableViewDelegate, UITableViewDataSource {
    var semesters: [Semester] { get }
    var selectedIndex: Int { get set }
    var dataChanged: (() -> ())? { get set }
    
    func start()
}

final class StudyPlanViewModel: NSObject, StudyPlanViewModelProtocol {
    
    private(set) var semesters: [Semester] = []
    var selectedIndex: Int = 0
    var currentLessons: [Lesson] {
        semesters[selectedIndex].lesson ?? []
    }
    var currentLessonClassTypes: [LessonClassType] {
        semesters[selectedIndex].lessonClassTypes ?? []
    }
    var dataChanged: (() -> ())?
    
    //MARK: - StudyPlanViewModelProtocol
    
    func start() {
        semesters = [
            .init(id: UUID().hashValue,
                  name: "Семестр 5",
                  lesson: Lesson.randomData(),
                  lessonClassTypes: [
                    .init(name: "Лекция"),
                    .init(name: "Семинар"),
                    .init(name: "Лаба"),
                    .init(name: "Зачет"),
                    .init(name: "Экзамен")
                  ]),
            .init(id: UUID().hashValue,
                  name: "Семестр 6",
                  lesson: Lesson.randomData(),
                  lessonClassTypes: [
                    .init(name: "Лекция"),
                    .init(name: "Семинар"),
                    .init(name: "Лаба"),
                    .init(name: "Зачет"),
                    .init(name: "Экзамен")
                  ])
        ]
        selectedIndex = 0
        dataChanged?()
    }
}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension StudyPlanViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LessionsTVCell.load(for: tableView, indexPath: indexPath)
        let headers = semesters[selectedIndex].lessonClassTypes?.compactMap({$0.name}) ?? []
        let viewModel: LessionsViewModel = .init(data: currentLessons, headers: headers)
        cell.configure(viewModel: viewModel)
        cell.layoutIfNeeded()
        tableView.beginUpdates()
        tableView.endUpdates()
        return cell
    }
}

