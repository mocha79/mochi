//
//  AddInformationViewController.swift
//  prototype
//
//  Created by T-mochi on 2016/11/27.
//  Copyright © 2016年 T-mochi. All rights reserved.
//

import UIKit

class AddInformationViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var OthersTextField: UITextField!
    
    //中間データ
    var N: String!
    var E: String!
    var O: String!
    
    //とりあえず宣言、要らなかったら消す
    var Name: [[AnyObject]] = [[]]
    var Email: [AnyObject] = []
    var Others: [AnyObject] = []
    var DataArray: [AnyObject] = []
    
    //機能拡張枠 宣言
    @IBOutlet var STextField: UITextField!
    @IBOutlet var MTextField: UITextField!
    //機能拡張枠 中間データ
    var S1: String!
    var M1: String!
    
    
    //ユーザーデフォルトの宣言
    //ができなかったのでNSUserDfaultsの宣言
    //let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    //上のやつが死んだので新しいやつの宣言
    let saveData2: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.NameTextField.delegate = self
        self.EmailTextField.delegate = self
        self.OthersTextField.delegate = self
        
        
        if (saveData2.array(forKey: "name") != nil){
            DataArray = saveData2.array(forKey: "name")! as [AnyObject]
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func AddData() {
        N = NameTextField.text
        //Name.append(N)
        E = EmailTextField.text
        //Email.append(E)
        O = OthersTextField.text
        //Others.append(O)
        
        // || self.E != nil || self.O != nil
        
        if (self.N.isEmpty) {
            NSLog("11")
        } else if (self.E.isEmpty) {
            NSLog("12")
        }else if (self.O.isEmpty) {
            NSLog("13")
        }else{
            NSLog("10")
            let alertController2 = UIAlertController(title: "確認", message: "名前" + N + "\nE-mailアドレス" + E + "\nその他" + O , preferredStyle: .alert)
        
        
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {
                action in self.navigationController!.popViewController(animated: true)
                
                let allData = ["name":self.N,"Email":self.E,"Others":self.O]
            
                self.DataArray.append(allData as AnyObject)
            
                self.saveData2.set(self.DataArray, forKey: "name")
                self.saveData2.synchronize()
            
                
        
        })
            let cancelAction = UIAlertAction(title:"NO", style: .cancel, handler:
                nil
            )
            alertController2.addAction(defaultAction)
            alertController2.addAction(cancelAction)
        
            present(alertController2, animated: true, completion: nil)
        }
        
        //saveData2.setObject(E, forKey: "Email")
        //saveData2.synchronize()
        //saveData2.setObject(O, forKey: "Others")
        //saveData2.synchronize()
        //if Name.count != Email.count || Name.count != Others.count || Email.count != Others.count {
          //  let alertController = UIAlertController(title: "エラー", message: "人数と情報の数が一致していません", preferredStyle: .Alert)
            
           // let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            //alertController.addAction(defaultAction)
            
            //presentViewController(alertController, animated: true, completion: nil)}
    }
    
    //機能拡張枠 機能追加
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        self.NameTextField.delegate = self
        self.EmailTextField.delegate = self
        self.OthersTextField.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
