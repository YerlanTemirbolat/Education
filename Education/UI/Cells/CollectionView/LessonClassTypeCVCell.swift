//
//  LessonClassTypeCVCell.swift
//  Education
//
//  Created by Admin on 20.03.2021.
//

import UIKit

final class LessonClassTypeCVCell: UICollectionViewCell {
    
    private struct UIConstants {
        private init() {}
        
        static let rowHeight = 63.5
        static let headerHeight = 80
        static let collectionHaderHeight = 40
        static let lessonTypeHeader = 39
        static let padding: CGFloat = 8
        static let largePadding: CGFloat = 24
    }
    
    private let contentStack: UIStackView = {
        let contentStack = UIStackView()
        contentStack.distribution = .fill
        contentStack.axis = .vertical
        contentStack.spacing = 0
        return contentStack
    }()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Public
    
    func configure(viewModel: LessonClassTypeViewModelProtocol) {
        contentStack.arrangedSubviews.forEach({$0.removeFromSuperview()})
        
        let header = UILabel()
        header.textColor = .darkGray
        header.textAlignment = .center
        header.backgroundColor = .lightGray
        let style: StandardLabelParameters = .onlyText(text: viewModel.header)
        style.apply(to: header)
        contentStack.addArrangedSubview(header)
        var labelWidth = viewModel.header.width(withConstrainedHeight: CGFloat(UIConstants.collectionHaderHeight), font: header.font) + 20/*label text offsets*/
        labelWidth = labelWidth < CGFloat(UIConstants.headerHeight) ? CGFloat(UIConstants.headerHeight) : labelWidth
        header.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.lessonTypeHeader)
            make.width.equalTo(labelWidth)
        }
        contentStack.layer.borderWidth = 0.5
        contentStack.layer.borderColor = UIColor.lightGray.cgColor

        viewModel.lessonData.enumerated().forEach { index, lessonData in
            let contentLabel = UILabel()
            contentLabel.textAlignment = .center
            layer.masksToBounds = false
            clipsToBounds = false
            contentStack.layer.masksToBounds = false
            contentStack.clipsToBounds = false
        
            defer {
                contentStack.addArrangedSubview(contentLabel)
                contentLabel.snp.makeConstraints { make in
                    make.height.equalTo(UIConstants.rowHeight)
                }
                
                let separator = UIView()
                separator.backgroundColor = .lightGray
                contentStack.addArrangedSubview(separator)
                separator.snp.makeConstraints { make in
                    make.height.equalTo(0.5)
                }
            }
            guard let total = lessonData?.totalHours, let planned = lessonData?.plannedHours else {
                let style: StandardLabelParameters = .onlyText(text: " ")
                style.apply(to: contentLabel)
                return
            }
            let totalString = "\(total)"
            let plannedHoursString = "\(planned)"
            let attributedString = NSMutableAttributedString(string: "\(total) / \(planned)")
            if total < planned {
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location: 0, length: totalString.count))
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location: attributedString.length - plannedHoursString.count, length: plannedHoursString.count))
            } else if total == planned {
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location: 0, length: totalString.count))
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location: attributedString.length - plannedHoursString.count, length: plannedHoursString.count))
            }
            let style: StandardLabelParameters = .attributed(attributedString)
            style.apply(to: contentLabel)
        }
    }
    
    //MARK: - Private
    
    private func setupView() {
        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
