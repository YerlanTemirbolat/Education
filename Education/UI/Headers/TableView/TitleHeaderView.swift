//
//  TitleHeaderView.swift

import UIKit

class TitleHeaderView: UIView {
    // MARK: Variables
    let insets: UIEdgeInsets
    
    // MARK: Views
    let titleLabel = UILabel()
    
    // MARK: Initializers
    init(insets: UIEdgeInsets, title: StandardLabelParameters, backgroundColor: UIColor) {
        self.insets = insets
        super.init(frame: .zero)
        sizeToFit()
        
        self.backgroundColor = backgroundColor
        title.apply(to: titleLabel)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        self.insets = .zero
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: Private
    private func setupView() {
        addSubview(titleLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(insets.left)
            make.top.equalToSuperview().offset(insets.top)
            make.trailing.equalToSuperview().offset(insets.right)
            make.bottom.equalToSuperview().offset(insets.bottom)
        }
    }
}
