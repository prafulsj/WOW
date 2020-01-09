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
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    let label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.red
        return label
    }()

    let subLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.red
        return label
    }()

    let viewDetail: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.red
        return label
    }()

    let containerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.layer.cornerRadius = 20
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        containerView.backgroundColor = UIColor.gray
        addSubview(containerView)
        containerView.addSubview(storyImageView)
        containerView.addSubview(label)
        containerView.addSubview(subLabel)
        containerView.addSubview(viewDetail)
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
        subLabel.text = "SubLabel"
        viewDetail.text = "View Details >>"
    }

    func setConstraint() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        storyImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(60)
        }
        label.snp.makeConstraints { make in
            make.leading.equalTo(storyImageView.snp.trailing)
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(5)
        }
        subLabel.snp.makeConstraints { make in
            make.leading.equalTo(storyImageView.snp.trailing)
            make.top.equalTo(label.snp.bottom)
            make.trailing.equalToSuperview().inset(5)
        }
        viewDetail.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(5)
            make.top.equalTo(subLabel.snp.bottom)
        }
    }

}
