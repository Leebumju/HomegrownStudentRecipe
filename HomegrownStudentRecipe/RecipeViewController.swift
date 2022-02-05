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
    @IBOutlet weak var recipe: UILabel!
    
    let chickenList = ["치킨 커리","치킨 샐러드"]
    let pastaList = ["크림 파스타", "토마토 파스타"]
    let pizzaList = ["새우 피자", "딸기 피자"]
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if let name = self.name {
            let img = UIImage(named: "\(name).jpg")
            foodImgView.image = img
            recipeName.text = name
            if name == "치킨 커리" {
                material1.text = "닭가슴살 100g\n카레파우더 2TS\n터마릭 파우더 1TS\n오레가노 파우더 1TS\n후추 1/2TS"
                material1.numberOfLines = 5
                recipe.text = "1.물 500ml를 부어주세요!\n2.치킨을 먹기 좋은 사이즈로 잘라 주세요!\n3.준비한 카레파우더를 끓는 물에 부어주세요!\n4.터마릭 파우더와 오레가노 파우더를 잘 섞어주세요!"
                recipe.numberOfLines = 4
            } else if name == "크림 파스타" {
                material1.text = "bulgogi source 1 spoon \nwhipping source 4spoon \nsour cream 3spoon"
                material1.numberOfLines = 3
            } else {
                material1.text = "준비 예정입니다!"
                recipe.text = "준비 예정입니다!"
            }
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
