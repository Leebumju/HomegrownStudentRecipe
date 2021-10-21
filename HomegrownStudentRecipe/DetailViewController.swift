//
//  DetailViewController.swift
//  HomegrownStudentRecipe
//
//  Created by 이범준 on 2021/10/20.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var foodName: String? //
  
    //let foodList = ["chicken","pasta","pizza"]
    let chickenList = ["chicken curry","chicken salad"]
    let pastaList = ["cream pasta", "tomato pasta"]
    let pizzaList = ["shrimp pizza", "strawberry pizza"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipe"{
            let vc = segue.destination as? RecipeViewController
            if let index = sender as?Int{
                vc?.name = chickenList[index] 
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(foodName == "chicken"){
            return chickenList.count
        }else if(foodName == "pasta"){
            return pastaList.count
        }else{
            return pizzaList.count
        }
    }
    
    @IBOutlet weak var foodLabel: UILabel! //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    

    func updateUI() {
        if let foodName = self.foodName{
                foodLabel.text = foodName
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let foodCell = tableView.dequeueReusableCell(withIdentifier: "foodCell",for: indexPath) as? ChickenListCell {
            if(foodName=="chicken"){
                let img=UIImage(named:"\(chickenList[indexPath.row]).jpeg")
                foodCell.chickenImgView.image = img
                foodCell.chickenFoodLabel.text = chickenList[indexPath.row]
                return foodCell
            }else if(foodName == "pasta"){
                let img = UIImage(named:"\(pastaList[indexPath.row]).jpeg")
                foodCell.chickenImgView.image = img
                foodCell.chickenFoodLabel.text = pastaList[indexPath.row]
                return foodCell
            }else{
                let img = UIImage(named:"\(pizzaList[indexPath.row]).jpeg")
                foodCell.chickenImgView.image = img
                foodCell.chickenFoodLabel.text = pizzaList[indexPath.row]
                return foodCell
            }
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showRecipe", sender: indexPath.row)
    }
    
    
    
    
    @IBAction func close(_ sender:Any){
        dismiss(animated: true, completion: nil)
    }
  

}

class ChickenListCell: UITableViewCell{
    @IBOutlet weak var chickenImgView: UIImageView!
    @IBOutlet weak var chickenFoodLabel: UILabel!
}
