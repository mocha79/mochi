//
//  Add2ViewController.swift
//  prototype
//
//  Created by T-mochi on 2017/05/06.
//  Copyright © 2017年 T-mochi. All rights reserved.
//

import UIKit

class Add2ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    var DataArray: [AnyObject] = []
    
     let saveData2: UserDefaults = UserDefaults.standard
    
    //機能拡張枠 宣言
    @IBOutlet var STextField: UITextField!
    @IBOutlet var MTextView: UITextView!
    //機能拡張枠 中間データ
    var S1: String!
    var M1: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        STextField.delegate = self
        MTextView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func AddData2() {
        
       
        
        
        
        self.S1 = self.STextField.text
        self.M1 = self.MTextView.text
        self.saveData2.set(self.S1, forKey: "subject")
        self.saveData2.set(self.M1, forKey: "message")
        
        self.saveData2.synchronize()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
