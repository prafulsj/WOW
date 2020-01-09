//
//  TopStoriesTableViewCell.swift
//  WOW
//
//  Created by Praful on 09/01/20.
//  Copyright © 2020 Praful. All rights reserved.
//

import UIKit
import SnapKit

class TopStoriesTableViewCell: UITableViewCell {

    let label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.red
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(label)
        setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadView() {
        label.text = "Praful"
        label.sizeToFit()

    }

    func setConstraint() {
        label.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(100)
        }
    }

}
