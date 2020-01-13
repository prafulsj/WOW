//
//  SecondViewController.swift
//  WOW
//
//  Created by Praful on 07/01/20.
//  Copyright © 2020 Praful. All rights reserved.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    let segmentController: UISegmentedControl = {
        let segments = UISegmentedControl(items: ["Upcoming", "Past"])
        segments.selectedSegmentIndex = 0
        return segments
    }()

    //replace this table view
    let upcomingTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.backgroundColor = UIColor.red
        return view
    }()

    let pastTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.backgroundColor = UIColor.blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(segmentController)
        view.addSubview(pastTableView)
        view.addSubview(upcomingTableView)

        pastTableView.dataSource = self
        pastTableView.delegate = self
        upcomingTableView.dataSource = self
        upcomingTableView.delegate = self

        segmentController.addTarget(self, action: #selector(selectedSegment(sender:)), for: .valueChanged)
        setConstriant()
    }

    func setConstriant() {
        segmentController.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        upcomingTableView.snp.makeConstraints { make in
            make.top.equalTo(segmentController.snp.bottom).offset(10)
            make.leading.trailing.equalTo(segmentController)
            make.bottom.equalToSuperview()
        }

        pastTableView.snp.makeConstraints { make in
            make.top.equalTo(segmentController.snp.bottom).offset(10)
            make.leading.trailing.equalTo(segmentController)
            make.bottom.equalToSuperview()
        }
    }

    @objc
    func selectedSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 1, animations: {
                self.upcomingTableView.isHidden = false
                self.pastTableView.isHidden = true
            }) { _ in

            }
        case 1:
            UIView.animate(withDuration: 1, animations: {
                self.upcomingTableView.isHidden = true
                self.pastTableView.isHidden = false
            }) { _ in

            }
        default:
            break
        }
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == pastTableView {
            cell.backgroundColor = UIColor.red
        } else if tableView == upcomingTableView {
            cell.backgroundColor = UIColor.blue
        } else {
            cell.backgroundColor = UIColor.gray
        }
        return cell
    }


}

