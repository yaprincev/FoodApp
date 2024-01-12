//
//  MainViewController.swift
//  FoodApp
//
//  Created by Максим Япринцев on 12.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var promoCollection: UICollectionView!
    var images = ["Promo1", "Promo3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        button.titleLabel?.text = "Москва"
        button.sizeToFit()
        
        
        
        promoCollection.register(UINib(nibName: "\(PromoCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "Cell")
        promoCollection.dataSource = self
        promoCollection.delegate = self
        promoCollection.showsHorizontalScrollIndicator = false
        

        
        if let flowLayout = promoCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        // Do any additional setup after loading the view.
    }


}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = promoCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PromoCollectionViewCell
        cell.imageCell.image = UIImage(named: images[indexPath.row])
        print(cell.imageCell.frame.width)
        print(cell.imageCell.frame.height)
        cell.imageCell.layer.cornerRadius = 20
        cell.imageCell.clipsToBounds = true
        cell.imageCell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 112)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
    

