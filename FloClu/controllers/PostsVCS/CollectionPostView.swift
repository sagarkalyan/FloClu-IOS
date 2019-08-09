//
//  CollectionPostView.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-29.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation
import UIKit

class CollectionPostView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    //    let data = DataSet()
    var arrdata = [Post]()
    
    fileprivate var alertStyle: UIAlertController.Style = .actionSheet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getdata()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func getdata() {
        let url = URL(string: "https://floclu.ca/posts.php")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if error == nil {
                    self.arrdata = try JSONDecoder().decode([Post].self, from: data!)
                    
                    for mainarr in self.arrdata {
                        print(mainarr.title, " : ", mainarr.detail)
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                            
                        }
                    }
                }
            }
            catch {
                print("Error in getting json data")
            }
            }.resume()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        //        cell.locationName.text = locationNames[indexPath.row]
        //        cell.locationDescription.text = locationDescription[indexPath.row]
        
        cell.titleLebel.text = self.arrdata[indexPath.row].title
        cell.descriptionLabel.text = self.arrdata[indexPath.row].detail
        cell.Author.text = self.arrdata[indexPath.row].username
        
        if( indexPath.row % 2 == 0){
            cell.backgroundColor = color2
        }
        else{
            cell.backgroundColor = color3
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 8
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        // 1
        switch kind {
        // 2
        case UICollectionView.elementKindSectionHeader:
            // 3
            guard
                let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "postHeaderView",
                    for: indexPath) as? PostHeaderView
                else {
                    fatalError("Invalid view type")
            }
            
            let searchTerm = "Latest Posts"
            headerView.postHeaderLabel.text = searchTerm
            return headerView
        default:
            // 4
            assert(false, "Invalid element type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(style: self.alertStyle)
        
        let text: [AttributedTextBlock] = [
            .normal(""),
            .header1(arrdata[indexPath.row].title),
            
            .normal(self.arrdata[indexPath.row].detail),
        ]
        alert.addTextViewer(text: .attributedText(text))
        alert.addAction(title: "SendMessage")
        
        alert.addAction(title: "OK", style: .cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}


