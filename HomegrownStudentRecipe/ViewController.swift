//
//  ViewController.swift
//  HomegrownStudentRecipe
//
//  Created by 이범준 on 2021/10/15.
//
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate { //UIViewController, UITableViewDataSource, UITableViewDelegate is a protocol
    
    let foodList = ["치킨","파스타","피자"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //give data to detailViewController
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int{
                vc?.foodName = foodList[index]
            }
        }
    }
    
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
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}


//custom cell 
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
}
