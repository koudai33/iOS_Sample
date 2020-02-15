//
//  ViewController.swift
//  Calculator
//
//  Created by sakuma on 2019/10/09.
//  Copyright © 2019 sakuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var segmentedControl:
    UISegmentedControl!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func didTapCaluculate(_ sender: Any) {
        //計算ボタンをタップしたときに呼ばれる
        if self.firstTextField.text?.count == 0{
            showAler(title: "Error", message: "上のテキストに文字を入れてください")
            print("returnしました")
            return
        }
        if self.secondTextField.text?.count == 0{
            showAler(title: "Error", message: "下のテキストに文字を入れてください")
                   print("returnしました")
                   return
               }
        
        let first = Int(self.firstTextField.text ?? "")!
        let second = Int(self.secondTextField.text ?? "")!

        
        var result = 0
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            //足し算
            result = first + second
            break
        case 1:
            //引き算
            result = first - second
            break
        case 2:
            //掛け算
            result = first * second
            break
        case 3:
            //割り算
            result = first / second
            break
        default:
            break
        }
        print(result)
        
        resultLabel.text = String(result)
        
        self.performSegue(withIdentifier: "ResultSegue" , sender: result )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let next = segue.destination as? ResultViewController
                  let result = sender as! Int
                  next?.result = result
        }
    }
    
    func showAler(title:String, message:String){
        //ここでアラート表示
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}


