//
//  DetailViewController.swift
//  HomegrownStudentRecipe
//
//  Created by 이범준 on 2021/10/20.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var foodName: String?
    
    let chickenList = ["치킨 커리", "치킨 샐러드"]
    let pastaList = ["크림 파스타", "토마토 파스타"]
    let pizzaList = ["새우 피자", "딸기 피자"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipe" {
            let vc = segue.destination as? RecipeViewController
            if let index = sender as?Int {
                if foodName == "치킨" {
                    vc?.name = chickenList[index]
                } else if foodName == "피자" {
                    vc?.name = pizzaList[index]
                } else if foodName == "파스타" {
                    vc?.name = pastaList[index]
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if foodName == "치킨" {
            return chickenList.count
        } else if foodName == "파스타" {
            return pastaList.count
        } else {
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
        if let foodName = self.foodName {
            foodLabel.text = foodName
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let foodCell = tableView.dequeueReusableCell(withIdentifier: "foodCell",for: indexPath) as? ChickenListCell {
            if foodName == "치킨" {
                let img=UIImage(named:"\(chickenList[indexPath.row]).jpeg")
                foodCell.chickenImgView.image = img
                foodCell.chickenFoodLabel.text = chickenList[indexPath.row]
                return foodCell
            } else if foodName == "파스타" {
                let img = UIImage(named:"\(pastaList[indexPath.row]).jpeg")
                foodCell.chickenImgView.image = img
                foodCell.chickenFoodLabel.text = pastaList[indexPath.row]
                return foodCell
            } else {
                let img = UIImage(named:"\(pizzaList[indexPath.row]).jpeg")
                foodCell.chickenImgView.image = img
                foodCell.chickenFoodLabel.text = pizzaList[indexPath.row]
                return foodCell
            }
        } else {
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

class ChickenListCell: UITableViewCell {
    @IBOutlet weak var chickenImgView: UIImageView!
    @IBOutlet weak var chickenFoodLabel: UILabel!
}

