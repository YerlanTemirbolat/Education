//
//  ViewController.swift
//  Education
//
//  Created by Admin on 3/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("План обучения", for: .normal)
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
        
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationController?.navigationBar.shadowImage = UIImage()
        //navigationController?.navigationBar.isTranslucent = true
        
        setViewConstraints()
    }
    
    @objc func didTapButton() {
        let rootVC = SecondViewController()
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func setViewConstraints() {
        
        NSLayoutConstraint.activate([
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registrationButton.heightAnchor.constraint(equalToConstant: 55),
            registrationButton.widthAnchor.constraint(equalToConstant: 320)
        ])
    }
}
