//
//  TitleViewModelProtocol.swift
//  Education
//
//  Created by Admin on 20.03.2021.
//

import Foundation

protocol TitleViewModelProtocol: AnyObject {
    var title: StandardLabelParameters? { get }
}

final class TitleViewModel: TitleViewModelProtocol {
    
    var title: StandardLabelParameters?
    
    //MARK: - Initialization
    
    init(title: StandardLabelParameters?) {
        self.title = title
    }
}
