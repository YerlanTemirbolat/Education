//
//  SecondViewController.swift
//  Education
//
//  Created by Admin on 3/10/21.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = rowsToDisplay[indexPath.row]
        return cell
    }
        
    lazy var textView: UILabel = {
        let textView = UILabel()
        textView.text = "2018-2019 учебный год"
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.textAlignment = .center
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var segment: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Семестр 5", "Семестр 7"])
        sc.frame = CGRect(x: 0, y: 220, width: view.frame.size.width / 1, height: 50)
        sc.selectedSegmentIndex = 0
        sc.selectedSegmentTintColor = #colorLiteral(red: 0.9678236842, green: 0.8270635009, blue: 0.003910382744, alpha: 1)
        sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        //sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let table: UITableView = {
        let table = UITableView()
        table.frame = CGRect(x: 0, y: 270, width: 500, height: 700)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chevron"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleSegmentChange() {
        print(segment.selectedSegmentIndex)
        
        switch segment.selectedSegmentIndex {
        case 0:
            rowsToDisplay = semesterFive
        case 1:
            rowsToDisplay = semesterSeven
        default:
            break
        }
        
        table.reloadData()
    }
    
    let semesterFive = ["Электрохимия", "Основы химического анализа", "Иностранный язык"]
    
    let semesterSeven = ["Электрохимия", "Иностранный язык", "Основы химического анализа"]
    
    lazy var rowsToDisplay = semesterFive
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Индивидуальный учебный план"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9891169667, green: 0.6960145831, blue: 0.2316059768, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        table.dataSource = self
        table.delegate = self
        
        view.addSubview(textView)
        view.addSubview(segment)
        view.addSubview(table)
        
        setViewConstraints()
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func setViewConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50)
        ])
        
//        NSLayoutConstraint.activate([
//            table.topAnchor.constraint(equalTo: segment.topAnchor, constant: 20),
//            table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
//            table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
//        ])
    }
}
