//
//  StudyPlanViewController.swift
//  Education
//
//  Created by Admin on 3/10/21.
//

import UIKit

class StudyPlanViewController: UIViewController {
    
    private struct UIConstants {
        private init() {}
        
        static let largePadding: CGFloat = 24
        static let segmentOffset: CGFloat = 40
    }
    private let viewModel: StudyPlanViewModelProtocol = StudyPlanViewModel()
        
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = CommonStrings.studyYear20182019.localized
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    lazy var segment: UISegmentedControl = {
        let sc = UISegmentedControl(items: viewModel.semesters.lazy.compactMap({$0.name}))
        sc.selectedSegmentIndex = viewModel.selectedIndex
        sc.selectedSegmentTintColor = #colorLiteral(red: 0.9678236842, green: 0.8270635009, blue: 0.003910382744, alpha: 1)
        sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return sc
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.makeTable()
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.register(LessionsTVCell.self, forCellReuseIdentifier: LessionsTVCell.reuseIdentifier)
        return tableView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chevron"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleSegmentChange() {
        print(segment.selectedSegmentIndex)
        viewModel.selectedIndex = segment.selectedSegmentIndex
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = CommonStrings.individualPlan.localized
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9891169667, green: 0.6960145831, blue: 0.2316059768, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        viewModel.dataChanged = { [weak self] in
            guard let self = self else { return }
            self.view.addSubview(self.titleLabel)
            self.view.addSubview(self.segment)
            self.view.addSubview(self.tableView)
            
            self.setViewConstraints()
            self.view.updateConstraints()
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
        viewModel.start()
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func setViewConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(UIConstants.largePadding)
            make.leading.equalTo(UIConstants.largePadding)
            make.trailing.equalTo(-UIConstants.largePadding)
        }
        titleLabel.snp.contentCompressionResistanceVerticalPriority = 999
        titleLabel.snp.contentHuggingVerticalPriority = 999
        
        segment.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIConstants.segmentOffset)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segment.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottomMargin)
        }
    }
}
