//
//  MainViewController.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {
    
    let viewModel: MainViewModel
    
    lazy var tableView: UITableView! = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.dataSource  = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        view.addSubview(tableView)
        
        
        tableView.register(ArticleCell.self)
        tableView.register(ImageCell.self)
        tableView.register(ColorBlockCell.self)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cell(for: tableView, at: indexPath)
    }
    
    
}
