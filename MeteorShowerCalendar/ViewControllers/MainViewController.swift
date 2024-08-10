//
//  ViewController.swift
//  MeteorShowerCalendar
//
//  Created by Victor on 09.08.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Meteor Showers"
        tableViewSetup()
    }


}


// MARK: - UITableView setup

extension MainViewController {
    
    func tableViewSetup() {
        view.addSubview(tableView)
        setDelegates()
        
        tableView.register(MeteorTableViewCell.self, forCellReuseIdentifier: Cells.meteorCell)
        tableView.register(TopTableViewCell.self, forCellReuseIdentifier: Cells.topCell)
        
        tableView.rowHeight = 100
        tableView.pin(to: view)
        tableView.contentInset = UIEdgeInsets.zero
    }
    
    func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Creating sections
extension MainViewController {
    
    enum TableViewSections: Int, CaseIterable {
        case top, list
    }
    
}

// MARK: - UITableViewDataSource & Delegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - add sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableViewSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TableViewSections(rawValue: section) == .top ? 1 : 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = TableViewSections(rawValue: indexPath.section)!
        
        switch sections {
        case .top:
            let topCell = tableView.dequeueReusableCell(withIdentifier: Cells.topCell, for: indexPath) as! TopTableViewCell
            topCell.backgroundColor = .green
            return topCell
        case .list:
            let lowerTopCell = tableView.dequeueReusableCell(withIdentifier: Cells.meteorCell, for: indexPath) as! MeteorTableViewCell
            lowerTopCell.backgroundColor = .nanoBlue
            return lowerTopCell
        }
    }
    
}

// MARK: - Cell names
extension MainViewController {
    struct Cells {
        static let meteorCell = "MeteorTableViewCell"
        static let topCell = "TopTableViewCell"
    }
}
