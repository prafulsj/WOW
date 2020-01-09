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

    let storyImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        return imageView
    }()

    let label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.red
        return label
    }()

    let containerView = UIView(frame: CGRect.zero)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        containerView.backgroundColor = UIColor.gray
        addSubview(containerView)
//        containerView.addSubview(storyImageView)
//        containerView.addSubview(label)
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
        label.backgroundColor = UIColor.yellow
        storyImageView.backgroundColor = UIColor.orange
        label.sizeToFit()

    }

    func setConstraint() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().offset(20)
        }



//        storyImageView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(10)
////            make.bottom.equalToSuperview().offset(10)
//            make.height.equalTo(60)
//            make.width.equalTo(50)
//            make.leading.equalToSuperview().offset(20)
//        }
//        label.snp.makeConstraints { make in
////            make.width.equalToSuperview().multipliedBy(0.5)
//            make.leading.equalTo(storyImageView.snp_trailingMargin).offset(10)
//            make.top.equalTo(storyImageView).offset(10)
//            make.trailing.equalToSuperview().offset(-20)
//        }
    }

}
