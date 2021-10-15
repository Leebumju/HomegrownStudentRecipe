//
//  ViewController.swift
//  HomegrownStudentRecipe
//
//  Created by 이범준 on 2021/10/15.
//
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate { //UIViewController, UITableViewDataSource, UITableViewDelegate is a protocol
    
    let foodList = ["chicken","pasta","pizza"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //answer UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
            let img = UIImage(named: "\(foodList[indexPath.row]).jpeg")
            cell.imgView.image = img
            cell.foodLabel.text = foodList[indexPath.row]
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("-->\(indexPath.row)")
    }
}


//custom cell
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
}
