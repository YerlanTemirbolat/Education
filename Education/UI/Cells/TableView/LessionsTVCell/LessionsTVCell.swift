//
//  LessionsTVCell.swift
//  Education
//
//  Created by Admin on 19.03.2021.
//

import UIKit

final class LessionsTVCell: BaseTVCell<LessionsViewModelProtocol> {
    
    private struct UIConstants {
        private init() {}
        
        static let rowHeight = 64
        static let headerHeight = 80
        static let collectionHaderHeight = 40
        static let padding: CGFloat = 8
        static let largePadding: CGFloat = 24
        static let tableWidth = 150
    }
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView.makeTable()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.rowHeight = CGFloat(UIConstants.rowHeight)
        tableView.register(TitleTVCell.self, forCellReuseIdentifier: TitleTVCell.reuseIdentifier)
        return tableView
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(SimpleCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SimpleCollectionHeader.reuseIdentifier)
        collectionView.register(LessonClassTypeCVCell.self, forCellWithReuseIdentifier: LessonClassTypeCVCell.reuseIdentifier)
        return collectionView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        let style: StandardLabelParameters = .normal(text: CommonStrings.classLessonsTitle.localized, color: .darkGray, font: .systemFont(ofSize: 16), alignment: .center, numberOfLines: 0)
        style.apply(to: titleLabel)
        titleLabel.backgroundColor = .lightGray
        
        return titleLabel
    }()
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    
    override internal func bindViewModel() {
        tableView.reloadData()
        collectionView.reloadData()
        tableView.snp.remakeConstraints({ make in
            make.top.leading.bottom.equalToSuperview()
            make.height.equalTo(viewModel.data.count * UIConstants.rowHeight + UIConstants.headerHeight)
            make.width.equalTo(UIConstants.tableWidth)
        })
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
}
 
//MARK: - UITableViewDelegate, UITableViewDataSource
extension LessionsTVCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TitleTVCell.load(for: tableView, indexPath: indexPath)
        let lesson = viewModel.data[indexPath.row]
        let viewModel: TitleViewModel = .init(title: .onlyText(text: lesson.name))
        cell.configure(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .lightGray
        
        let titleLabel = UILabel()
        let style: StandardLabelParameters = .normal(text: CommonStrings.lessonTitle.localized, color: .darkGray, font: .systemFont(ofSize: 16), alignment: .left, numberOfLines: 0)
        style.apply(to: titleLabel)
        
        header.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-UIConstants.padding)
            make.leading.equalTo(UIConstants.padding)
            make.trailing.equalTo(-UIConstants.padding)
            make.top.greaterThanOrEqualTo(UIConstants.largePadding)
        }
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(UIConstants.headerHeight)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension LessionsTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.headers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LessonClassTypeCVCell.load(into: collectionView, for: indexPath)
        let lessonsData = self.viewModel.data.map({$0.data?[indexPath.section]})
        let viewModel: LessonClassTypeViewModel
        viewModel = .init(lessonData: lessonsData, header: self.viewModel.headers[indexPath.section])
        cell.configure(viewModel: viewModel)
        cell.layoutIfNeeded()
        return cell
    }
}

//MARK: - Private

private extension LessionsTVCell {
    func setupView() {
        contentView.addSubview(tableView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)

        setupConstraints()
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints({ make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(UIConstants.tableWidth)
        })
       
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(tableView.snp.trailing)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(UIConstants.headerHeight / 2)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(tableView.snp.trailing)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
