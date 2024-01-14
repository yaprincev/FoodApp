//
//  MainViewController.swift
//  FoodApp
//
//  Created by Максим Япринцев on 12.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var yOutletChoiseCollection: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var promoCollection: UICollectionView!
    @IBOutlet weak var choiseCollection: UICollectionView!
    
    
    enum collections {
        case promoCollection
        case choiseCollection
    }
    
    let images = ["Promo1", "Promo3"]
    let choose = ["Pizza", "Combo", "Desert", "Drinks"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        configureChoiseCollection()
        configurePromoCollection()
        configureAppearance()
        let collectionViewTop = yOutletChoiseCollection.constant
        
    }


}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.promoCollection {
            return images.count
        } else {
            return choose.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.promoCollection {
            let cell = promoCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PromoCollectionViewCell
            cell.imageCell.image = UIImage(named: images[indexPath.row])
            return cell
        } else {
            let cell = choiseCollection.dequeueReusableCell(withReuseIdentifier: "ChoiceCell", for: indexPath) as! ChoiseCollectionViewCell
            cell.choiseButton.setTitle(choose[indexPath.row], for: .normal)
            cell.choiseButton.setTitle(choose[indexPath.row], for: .highlighted)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == promoCollection {
            return CGSize(width: 350, height: 112)
        } else {
            return CGSize(width: 88, height: 32)
        }
    }
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         if collectionView == promoCollection {
             return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
         } else {
             return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
         }
     
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         if collectionView == promoCollection {
             return 10
         } else {
             return 10
         }
         
     }
     
}
     
    

/*extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            let yoffset = scrollView.contentOffset.y
            if yoffset > 0 {
                yOutletChoiseCollection = max(collectionViewTop - yoffset, 0)
            }
        }
    }
}*/


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "2"
        return cell
    }
    
}



extension MainViewController {
    
    func configureAppearance() {
        button.sizeToFit()
        button.titleLabel?.textColor = .black
        button.setTitle("Москва", for: .normal)
        button.setTitle("Москва", for: .highlighted)
        
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
    }
    
    
    
    func configurePromoCollection() {
        promoCollection.register(UINib(nibName: "\(PromoCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "Cell")
        promoCollection.dataSource = self
        promoCollection.delegate = self
        promoCollection.showsHorizontalScrollIndicator = false
        if let flowLayout = promoCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    
    func configureChoiseCollection() {
        choiseCollection.register(UINib(nibName: "\(ChoiseCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "ChoiceCell")
        choiseCollection.dataSource = self
        choiseCollection.delegate = self
        choiseCollection.showsHorizontalScrollIndicator = false
        if let flowLayout = choiseCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }
}
