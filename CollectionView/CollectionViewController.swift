//
//  CollectionViewController.swift
//  alertController
//
//  Created by Egor Devyatov on 20/08/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let reuseIdentifier = "CollectionCell"
    
    var label = UILabel()
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // обязательно добавить contentView нашего коллекшена как датасорс
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        
        myCollectionView.allowsSelection = true
        myCollectionView.allowsMultipleSelection = true
        
        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    // число секций
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let collectionItems = sourceData.count
        return collectionItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        cell.contentView.backgroundColor = .random
        
        print("cell #\(String(describing: cell.collectionCellLabel.text)) status \(cell.isSelected.description)")
        
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.masksToBounds = true
        
        cell.collectionCellLabel.text = sourceData[indexPath.row]
        
        if cell.isSelected == true {
            // добавим лейер с черной рамкой выбора
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 3
            
        } else {
        }
    
        return cell
    }
    
    // рисуем рамку если мы нажали клетку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            
        print("superlayer = \(String(describing: cell.contentView.layer.superlayer))")
        print("Added layer = \(String(describing: cell.contentView.layer))")
        
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 3
        // добавим лейер с черной рамкой выбора и все это в блоке анимации
        UIView.animate(withDuration: 2.0, animations: {
            cell.contentView.alpha = 0.0
        })
        cell.isSelected = true
        }
        
    }

   
    // стираем рамку если мы нажали клетку котрую уже выбирали didDeselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            print("------ deselect!")
            //let cellLayer = cell?.contentView.layer
//           cell?.contentView.layer.borderColor = UIColor.lightGray.cgColor
//            cell?.layer.borderWidth = 3
            print("Layer = \(String(describing: cell.contentView.layer))")
            print("layers: \(String(describing: cell.contentView.layer.sublayers))")
            print("layers = \(String(describing: cell.contentView.layer.sublayers?.capacity))")
        
            // снимаем рамку выбранной ячейки
//            cell.selectedBackgroundView?.backgroundColor = nil
//            cell.selectedBackgroundView?.layer.removeFromSuperlayer()
        
            //cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
            cell.contentView.layer.borderWidth = 0
        
            //  анимашка с альфа лейером
            UIView.animate(withDuration: 2.0, animations: {
                cell.contentView.alpha = 1.0
                })
            cell.isSelected = false
        }
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.selectedBackgroundView?.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            cell.selectedBackgroundView?.layer.borderWidth = 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.selectedBackgroundView?.backgroundColor = nil
            cell.selectedBackgroundView?.layer.removeFromSuperlayer()
        }
    }

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
//    override func viewWillLayoutSubviews() {
//        myCollectionView.reloadData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        // определяем свой лейоут для ячеек
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: elementSize, height: elementSize)
        myCollectionView.setCollectionViewLayout(layout, animated: true)
        
        // обновляем данные
        myCollectionView.reloadData()
    }
    
}
