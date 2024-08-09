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
        
        tableViewSetup()
    }


}


// MARK: - UITableView setup

extension MainViewController {
    
    func tableViewSetup() {
        view.addSubview(tableView)
        setDelegates()
        
        tableView.register(MeteorTableViewCell.self, forCellReuseIdentifier: Cells.meteorCell)
        
        tableView.rowHeight = 100
        tableView.pin(to: view)
        tableView.contentInset = UIEdgeInsets.zero
    }
    
    func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource & Delegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lowerTopCell = tableView.dequeueReusableCell(withIdentifier: Cells.meteorCell, for: indexPath) as! MeteorTableViewCell
        lowerTopCell.backgroundColor = .nanoBlue
        return lowerTopCell
    }
    
}

// MARK: - Cell names
extension MainViewController {
    struct Cells {
        static let meteorCell = "MeteorTableViewCell"
    }
}
