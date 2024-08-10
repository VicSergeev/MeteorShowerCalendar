//
//  TopTableViewCell.swift
//  MeteorShowerCalendar
//
//  Created by Victor on 10.08.2024.
//

import UIKit

class TopTableViewCell: BaseTableViewCell {
    static let identifier = "TopTableViewCell"
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 0
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.backgroundColor = .nanoBlue

        return stack
    }()
    
    override func setupViews() {
        addSubview(stackView)
//        stackView.backgroundColor = .nanoBlue
    }
    
}
