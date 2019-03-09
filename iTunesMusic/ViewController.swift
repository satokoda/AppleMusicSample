//
//  ViewController.swift
//  iTunesMusic
//
//  Created by S's MacBook Air on 2019/03/09.
//  Copyright © 2019 com_stskdir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array = ["あっちゃん", "さとし", "りょう"]
    
    @IBOutlet var appleMusicTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func configureTableView(){
        appleMusicTableView.dataSource = self
        appleMusicTableView.delegate = self
        
        let cell = UINib(nibName: "AppleMusicTableViewCell", bundle: Bundle.main)
        appleMusicTableView.register(cell, forCellReuseIdentifier: "AppleMusicTableViewCell")
        
        appleMusicTableView.separatorStyle = .none
        appleMusicTableView.tableFooterView = UIView()
        
        appleMusicTableView.rowHeight = 250.0
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppleMusicTableViewCell") as! AppleMusicTableViewCell
        cell.cotegoryLabel.text = array[indexPath.row]
        cell.setCllectionViewDelegate(dataSource: self, delegate: self, forRow: indexPath.row)
        return cell
    }

}

extension ViewController: UIPageViewControllerDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 5
        } else if collectionView.tag == 1 {
            return 2
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleMUsicCollectionViewCell", for: indexPath) as! AppleMusicTableViewCell
    
        cell.musicCollectionView.image = UIImage(named: "back.jpg")
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: collectionView.frame.width / 2 - 0, height: collectionView.frame.width / 2 - 0)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cellectionView.cellectionViewLayout = layout
        
        return cell
    }
}
