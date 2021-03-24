//
//  TitleTVCell.swift
//  Education
//
//  Created by Admin on 20.03.2021.
//

import UIKit

final class TitleTVCell: BaseTVCell<TitleViewModel> {
    
    private struct UIConstants {
        private init() {}
        
        static let padding: CGFloat = 8
    }
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bindViewModel() {
        viewModel.title?.apply(to: titleLabel)
    }
}

//MARK: - Private
private extension TitleTVCell {
    func setupView() {
        contentView.addSubview(titleLabel)
        
        let separator = UIView()
        separator.backgroundColor = .lightGray
        contentView.addSubview(separator)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(UIConstants.padding)
            make.trailing.equalTo(-UIConstants.padding)
            make.height.greaterThanOrEqualTo(64)
        }
        separator.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.leading.equalTo(UIConstants.padding)
            make.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
}
