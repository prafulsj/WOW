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
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = UIColor.orange
//        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Dhoni")
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    let label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
//        label.backgroundColor = UIColor.yellow
        label.font = UIFont(name: "Thonburi-Bold", size: 14)
        return label
    }()

    let subLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
//        label.backgroundColor = UIColor.red
        label.numberOfLines = 2
        label.font = UIFont(name: "Thonburi", size: 12)
        return label
    }()

    let viewDetail: UILabel = {
        let label = UILabel(frame: CGRect.zero)
//        label.backgroundColor = UIColor.red
        label.font = UIFont(name: "Thonburi", size: 14)
        return label
    }()

    let containerView: UIView = {
        let view = UIView(frame: CGRect.zero)
//        view.backgroundColor = UIColor.gray
        return view
    }()
    
    let textContainerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor.green
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = UIColor.gray

        addSubview(containerView)
        containerView.addSubview(storyImageView)
        containerView.addSubview(textContainerView)

        textContainerView.addSubview(label)
        textContainerView.addSubview(subLabel)
        textContainerView.addSubview(viewDetail)
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
        label.text = "Praful Praful Praful Praful Praful Praful Praful Praful Praful Praful "


        subLabel.text = "SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel SubLabel "
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
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(85)
        }
        textContainerView.snp.makeConstraints { make in
            make.leading.equalTo(storyImageView.snp.trailing)
            make.trailing.equalToSuperview().inset(5)
            make.top.equalToSuperview().inset(12)
            make.bottom.equalTo(storyImageView.snp.bottom).inset(7)
        }
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(5)
            make.top.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(30)
        }
        subLabel.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.leading)
            make.top.equalTo(label.snp.bottom).offset(2)
            make.trailing.equalTo(label.snp.trailing)
        }
        viewDetail.snp.makeConstraints { make in
            make.trailing.equalTo(label.snp.trailing)
            make.top.equalTo(subLabel.snp.bottom).offset(2)
        }
    }

    func applyLayer() {
        let path = UIBezierPath(
            roundedRect: textContainerView.bounds,
            byRoundingCorners: [.topRight, .bottomRight],
            cornerRadii: CGSize(width: 30, height: 10))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        textContainerView.layer.mask = mask
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()

        applyLayer()
    }

}
