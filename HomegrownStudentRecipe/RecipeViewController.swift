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
    //@IBOutlet weak var etc: UILabel!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if let name = self.name{
            let img = UIImage(named: "\(name).jpg")
            foodImgView.image=img
            recipeName.text = name
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
