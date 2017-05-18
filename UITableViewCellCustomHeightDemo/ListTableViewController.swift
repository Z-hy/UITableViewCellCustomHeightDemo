//
//  ListTableViewController.swift
//  UITablviewViewCellCustomHeightDemo
//
//  Created by user on 2017/5/16.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    lazy var dataSource: [ListViewModel] = {
        var arry = [ListViewModel]()
        for i in 0..<6 {
            let model = ListViewModel()
            model.title = String(format:"第\(i+1)行")
            if 0 == i {
                model.description = String(format:"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                model.images = [UIImage(named:"1")!]
            } else if 1 == i {
                model.description = String(format:"asldfjlasjf;lajdfl;asjdfljasldfjalsjdflksjdflkjasldkfalksjdflkjasdflajsdflkasjdflkasjdf")
                model.images = []
            } else if 2 == i {
                model.description = String(format:"aaaaaaaaaa")
                model.images = [UIImage(named:"1")!, UIImage(named:"2")!, UIImage(named:"1")!]
            } else if 3 == i {
                model.description = String(format:"aaaaaaaaaaaaaaaaaasdflkajsdflkjasdflkjasflakjsdfljkasfd")
                model.images = [UIImage(named:"1")!, UIImage(named:"2")!, UIImage(named:"1")!, UIImage(named:"2")!]
            } else if 4 == i {
                model.description = String(format:"aaaaaaaaaaaa")
                model.images = [UIImage(named:"1")!, UIImage(named:"2")!, UIImage(named:"1")!, UIImage(named:"2")!, UIImage(named:"1")!, UIImage(named:"2")!, UIImage(named:"1")!, UIImage(named:"2")!]
            } else if 5 == i {
                model.description = String(format:"aaaaaaaaaaaaaaa")
                model.images = [UIImage(named:"1")!, UIImage(named:"2")!]
            }
            model.time = String(format: "2017/05/\(16+i)")
            arry.append(model)
        }
        return arry
    }()
    
    lazy var heightAtIndexPath: NSMutableDictionary = {
        var tmpDictionary = NSMutableDictionary()
        tmpDictionary["height"] = "150"
        return tmpDictionary
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! ListTableViewCell
        if dataSource.count > 0 && dataSource.count > indexPath.row {
            let model = dataSource[indexPath.row]
            cell.loadCellWithModel(model: model)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        heightAtIndexPath[indexPath] = cell.frame.size.height
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.heightAtIndexPath[indexPath]
        if let h = height {
            return h as! CGFloat
        } else {
            if dataSource.count > 0 && dataSource.count > indexPath.row {
                let model = dataSource[indexPath.row]
                return model.defaultHeight
            }
        }
        return 0
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
