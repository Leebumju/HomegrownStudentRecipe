//
//  RecipeViewController.swift
//  HomegrownStudentRecipe
//
//  Created by 이범준 on 2021/10/21.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var foodImgView: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var material1: UILabel!
    //material1.numberOfLines = 0
    
    
    let chickenList = ["chicken curry","chicken salad"]
    let pastaList = ["cream pasta", "tomato pasta"]
    let pizzaList = ["shrimp pizza", "strawberry pizza"]
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    
    func updateUI() {
        if let name = self.name{
            let img = UIImage(named: "\(name).jpg")
            //let mat: String = "sour cream"
            foodImgView.image=img
            recipeName.text = name
            if(name == "chicken curry"){
                material1.text = "sour cream 1 spoon \ngochujang 2 spoon"
                material1.numberOfLines = 2
            }else if(name == "cream pasta"){
                material1.text = "bulgogi source 1 spoon \nwhipping source 4spoon \nsour cream 3spoon"
                material1.numberOfLines = 3
            }
        }
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
