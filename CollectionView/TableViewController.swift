//
//  TableViewController.swift
//  alertController
//
//  Created by Egor Devyatov on 19/08/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Table view data source
    // идентификатор ячейки таблицы
    let cellReuseIdentifier = "cell"
    
    // кол-во секций таблицы
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    // количество строк таблицы = кол-во эдлементов в массиве sourceData
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceData.count
    }
    
    // Задаем хедер таблицы
    func tableView(_ tableView: UITableView, titleForHeaderInSection
        section: Int) -> String? {
        return "Header"
    }
    
    // Задаем футер таблицы
    func tableView(_ tableView: UITableView, titleForFooterInSection
        section: Int) -> String? {
        return "Footer"
    }
    
    // формирование ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = sourceData[indexPath.row]
        cell.textLabel?.textAlignment = .natural
        cell.textLabel?.textColor = .random
        
        return cell
    }
    
    // метод вызываемый по нажатию на ячейку таблицы UITableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка c индексом: \(indexPath.row)")
    }
    
    // задаем название кнопки "удалить" при удалении строки таблицы
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete cell"
    }
    
    
     // включаем для того чтобы можно было редактировать ячейки таблицы
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
    
     // поддержка кнопок удаление и инсерт.
     func tableView(_ tableView: UITableView,
                             commit editingStyle: UITableViewCell.EditingStyle,
                             forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // существенный момент в том что сначала надо удалить данные из datasource
            // и только потом вызвать метод tableView.deleteRows(at: [indexPath], with: .fade)
            // иначе крашнется приложение
            // удаляем в массиве строку
            sourceData.remove(at: indexPath.row)
            // удаляем из таблевью
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        
        if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            sourceData.insert("new element", at: sourceData.count+1)

            tableView.insertRows(at: [indexPath], with: .bottom)
            tableView.reloadData()
        }
     }
    
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("Data Source:")
        print(sourceData)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        print("Data Source:")
        print(sourceData)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }

}
