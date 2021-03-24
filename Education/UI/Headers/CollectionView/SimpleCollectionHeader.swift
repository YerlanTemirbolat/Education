//
//  SimpleCollectionHeader.swift

import UIKit

class SimpleCollectionHeader: UICollectionReusableView {
    
    private struct UIConstants {
        private init() {}
        
        static let padding: CGFloat = 8
    }
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    
    func configure(titleStyle: StandardLabelParameters) {
        titleStyle.apply(to: titleLabel)
    }
    
    
    //MARK: - Private
    
    private func setupView() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(UIConstants.padding)
            make.bottom.trailing.equalTo(-UIConstants.padding)
        }
    }
}
