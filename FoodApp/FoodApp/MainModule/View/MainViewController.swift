//
//  MainViewController.swift
//  FoodApp
//
//  Created by Максим Япринцев on 12.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    let images = ["Promo1", "Promo3"]
    let dishCount = [0: 0, 1: 10, 2: 23]
    let choose = ["Beef", "Pork", "Lamb"]
    
    // MARK: - Views
    
    @IBOutlet private weak var yOutletChoiseCollection: NSLayoutConstraint!
    @IBOutlet private weak var yOutletTableView: NSLayoutConstraint!
    @IBOutlet private weak var cityButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var promoCollection: UICollectionView!
    @IBOutlet private weak var choiseCollection: UICollectionView!
    @IBOutlet private weak var tabBar: UITabBar!
    
    // MARK: - Presenter
    
    var presenter: MainViewPresenterProtocol!
    

    var isScrollingDown = false
    var tappedIndex = 0
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChoiseCollection()
        configurePromoCollection()
        configureAppearance()
        configureTabBar()
        configureTableView()
    }
}

// MARK: - Private Methods

private extension MainViewController {
    
    func configureAppearance() {
        cityButton.sizeToFit()
        cityButton.titleLabel?.textColor = .black
        cityButton.setTitle("Москва  ", for: .normal)
        cityButton.setTitle("Москва  ", for: .highlighted)
        
        cityButton.setTitleColor(.black, for: .normal)

        cityButton.setImage(UIImage(named: "Arrow1"), for: .normal)
        cityButton.setImage(UIImage(named: "Arrow1"), for: .highlighted)
        cityButton.semanticContentAttribute = .forceRightToLeft
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
    
    func configureTabBar() {
        let menuTabBar = UITabBarItem(title: nil, image: UIImage(named: "TBMenu"), selectedImage: UIImage(named: "TBMenu"))
        let contactTabBar = UITabBarItem(title: nil, image: UIImage(named: "TBContact"), selectedImage: nil)
        let profileTabBar = UITabBarItem(title: nil, image: UIImage(named: "TBProfile"), selectedImage: nil)
        let basketTabBar = UITabBarItem(title: nil, image: UIImage(named: "TBBasket"), selectedImage: nil)
        tabBar.items?.removeAll()
        tabBar.items?.append(menuTabBar)
        tabBar.items?.append(contactTabBar)
        tabBar.items?.append(profileTabBar)
        tabBar.items?.append(basketTabBar)
        tabBar.tintColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1.0)
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

// MARK: - UICollectionView

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
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
            if tappedIndex != indexPath.row {
                cell.configureAppearance()
                cell.choiseButton.setTitle(choose[indexPath.row], for: .normal)
                cell.choiseButton.setTitle(choose[indexPath.row], for: .highlighted)
                cell.buttonTapHandler = {
                    let index = IndexPath(row: self.dishCount[indexPath.row] ?? 0, section: 0)
                    self.tableView.scrollToRow(at: index, at: .top, animated: true)
                    self.tappedIndex = indexPath.row
                    collectionView.reloadData()
                }
                return cell
            } else {
                cell.configureTappedAppearance()
                cell.choiseButton.setTitle(choose[indexPath.row], for: .normal)
                cell.choiseButton.setTitle(choose[indexPath.row], for: .highlighted)
                cell.buttonTapHandler = {
                    let index = IndexPath(row: self.dishCount[indexPath.row] ?? 0, section: 0)
                    self.tableView.scrollToRow(at: index, at: .top, animated: true)
                    self.tappedIndex = indexPath.row
                    collectionView.reloadData()
                }
                return cell
            }
            
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
     
// MARK: - UIScrollView

    
extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y

            if offsetY > 0 {
                // Скролл вниз
                if !isScrollingDown {
                    isScrollingDown = true
                    updateConstraintsForScrollingDown()
                }
            } else {
                // Скролл вверх
                if isScrollingDown {
                    isScrollingDown = false
                    updateConstraintsForScrollingUp()
                }
            }
        }
    
    private func updateConstraintsForScrollingDown() {
        UIView.animate(withDuration: 0.2) {
            self.promoCollection.alpha = 0.0
        }
        UIView.animate(withDuration: 0.3) {
            self.yOutletChoiseCollection.constant = 60
            self.yOutletTableView.constant = 116
            self.view.layoutIfNeeded()
        }
    }
    private func updateConstraintsForScrollingUp() {
        UIView.animate(withDuration: 0.3) {
            self.yOutletChoiseCollection.constant = 196
            self.yOutletTableView.constant = 252
            self.promoCollection.alpha = 1.0
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - UITableView

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dishes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.dishID.text = (cell.dishID.text ?? "") + (presenter.dishes?[indexPath.row].idMeal ?? "")
        cell.dishName.text = presenter.dishes?[indexPath.row].strMeal
        if let imageURL = presenter.dishes?[indexPath.row].strMealThumb, let url = URL(string: imageURL) {
            cell.dishImage.loadImage(from: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
}

// MARK: - Presenter methods

extension MainViewController: MainViewProtocol {
    func success() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
