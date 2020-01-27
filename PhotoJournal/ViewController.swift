//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Lilia Yudina on 1/27/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var pictures = [Picture]() {
          didSet {
              DispatchQueue.main.async {
                  self.collectionView.reloadData()
              }
          }
      }
    
    var array = ["Flower"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath) as? PictureViewCell else {
            fatalError("Couldn't dequeue the PictureViewCell")
        }
        let picture = pictures[indexPath.row]
        cell.configureCell(picture)
        cell.delegate = self
        return cell
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.8)
    }
}
extension ViewController: PictureViewCellDelegate {
    func displaySettings(_ cell: PictureViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "Edit", style: .default)
        let shareAction = UIAlertAction(title: "Share", style: .default)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(editAction)
         alertController.addAction(shareAction)
         alertController.addAction(deleteAction)
         alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
}
