//
//  LessionsViewModel.swift
//  Education
//
//  Created by Admin on 19.03.2021.
//

import Foundation

protocol LessionsViewModelProtocol: AnyObject {
    var data: [Lesson] { get }
    var headers: [String] { get }
}

final class LessionsViewModel: LessionsViewModelProtocol {
    
    var data: [Lesson] = []
    var headers: [String] = []
    
    //MARK: - Initialization
    
    init(data: [Lesson], headers: [String]) {
        self.data = data
        self.headers = headers
    }
}
