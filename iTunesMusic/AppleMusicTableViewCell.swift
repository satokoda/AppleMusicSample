//
//  AppleMusicTableViewCell.swift
//  iTunesMusic
//
//  Created by S's MacBook Air on 2019/03/09.
//  Copyright © 2019 com_stskdir. All rights reserved.
//

import UIKit

class AppleMusicTableViewCell: UITableViewCell {
    
    @IBOutlet var cotegoryLabel: UILabel!
    @IBOutlet var musicCollectionView: UICollectionView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionView<DataSource: UICollectionViewDataSource, Delegate: UICollectionViewDelegate>(dataSource: DataSouece, delegate:Delegate, forRow row: Int) {
        let nib = UINib(nibName:"AppleMUsicCollectionViewCell", bundle: Bundle.main)
        musicCollectionView.register(nib, forCellWithReuseIdentifier: "AppleMusicCollectionViewCell")
        musicCollectionView.delegate = delegate
        musicCollectionView.dataSource = dataSource
        musicCollectionView.tag = row
        musicCollectionView.reloadData()
    }
    
    
}
