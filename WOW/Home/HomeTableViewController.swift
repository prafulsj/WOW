//
//  HomeTableViewController.swift
//  WOW
//
//  Created by Praful on 09/01/20.
//  Copyright © 2020 Praful. All rights reserved.
//

import UIKit
import SnapKit
import MSPeekCollectionViewDelegateImplementation

class HomeTableViewController: UITableViewController {

    let TopStoriesCellID = "TopStoriesCellID"
    let TopStoriesTitleCellID = "TopStoriesTitleCellID"
    let LiveCollectionViewCell = "LiveCollectionViewCell"
    let LiveTableCollectionViewCell = "LiveTableCollectionViewCell"
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 10, y: 10, width: 100, height: 80), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.green
        return collectionView
    }()

    var behavior = MSCollectionViewPeekingBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TopStoriesTableViewCell.self, forCellReuseIdentifier: TopStoriesCellID)
        tableView.register(TopStoriesTitleTableViewCell.self, forCellReuseIdentifier: TopStoriesTitleCellID)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: LiveTableCollectionViewCell)
        tableView.backgroundColor = UIColor.red

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: LiveCollectionViewCell)
        collectionView.configureForPeekingBehavior(behavior: behavior)
        collectionView.dataSource = self
        collectionView.delegate = self

//        collectionView.snp.makeConstraints { make in
//            make.top.bottom.equalToSuperview().inset(10)
//            make.leading.trailing.equalToSuperview().inset(20)
//        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LiveTableCollectionViewCell", for: indexPath) as UITableViewCell
            cell.addSubview(collectionView)

            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TopStoriesTitleCellID, for: indexPath) as! TopStoriesTitleTableViewCell

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TopStoriesCellID, for: indexPath) as! TopStoriesTableViewCell

            cell.loadView()
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else if indexPath.row == 1 {
            return 45
        } else {
            return 125
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCollectionViewCell, for: indexPath)
        cell.contentView.backgroundColor = UIColor.red
        return cell
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        behavior.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
}
