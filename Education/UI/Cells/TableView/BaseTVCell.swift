//
//  BaseTVCell.swift
//  Education
//
//  Created by Admin on 19.03.2021.
//

import UIKit

class BaseTVCell<T>: UITableViewCell {
    
    var viewModel: T!
    var indexPath: IndexPath?
    
    ///Should be used for configuring cells
    func configure(viewModel: T) {
        self.viewModel = viewModel
        bindViewModel()
    }
    
    func bindViewModel() {}
}

