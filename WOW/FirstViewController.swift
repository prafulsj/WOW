//
//  FirstViewController.swift
//  WOW
//
//  Created by Praful on 07/01/20.
//  Copyright © 2020 Praful. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.red
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(label)
        label.text = "Praful"
        label.sizeToFit()
        setConstraint()
    }

    func setConstraint() {
        label.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
//            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
    }


}

