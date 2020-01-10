//
//  TopStoriesTitleTableViewCell.swift
//  WOW
//
//  Created by Praful on 10/01/20.
//  Copyright © 2020 Praful. All rights reserved.
//

import UIKit

class TopStoriesTitleTableViewCell: UITableViewCell {

    let containerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 12
        return view
    }()

    let label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Top Stories"
        label.font = UIFont(name: "Thonburi-Bold", size: 14)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = UIColor.gray

        addSubview(containerView)
        containerView.addSubview(label)
        setConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraint() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }

        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(10)
        }
    }
}
