//
//  InitialViewController.swift
//  Education
//
//  Created by Admin on 3/10/21.
//

import UIKit

class InitialViewController: UIViewController {
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle(CommonStrings.studyPlanTitle.localized, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9504194856, green: 0.9562203288, blue: 0.9692490697, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 27
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(registrationButton)
        
        setConstraints()
    }
    
    @objc func didTapButton() {
        let rootVC = StudyPlanViewController()
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registrationButton.heightAnchor.constraint(equalToConstant: 55),
            registrationButton.widthAnchor.constraint(equalToConstant: 320)
        ])
    }
}
