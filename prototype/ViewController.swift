//
//  ViewController.swift
//  prototype
//
//  Created by T-mochi on 2016/11/26.
//  Copyright © 2016年 T-mochi. All rights reserved.
//

import UIKit
import MessageUI
import Messages


class ViewController: UIViewController,MFMailComposeViewControllerDelegate, UITableViewDataSource,UITableViewDelegate{


    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var button : UIButton!
    
    var A: Int!
    var number: Int!
    var Name2: [[String]] = [[]]
    var Email2: [String] = []
    var Others2: [String] = []
    var adless: String!
    //急遽追加
    var DataArray:[AnyObject] = []
    
    var Atesaki: [[String]] = [[""]]
    var index = 0
    
    var S: String! = "test"
    var M: String! = "Hello"
    var    select: Bool = false
    
    var naiyou: String! = "本当に削除してもいいですか？"
    
    //ユーザーデフォルトの宣言
    //ができなかったのでNSUserDfaultsの宣言 saveDataは死んだ
    let saveData2: UserDefaults = UserDefaults.standard
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        //DataArray = lineChange.componentsSeparatedVyString("n")
        
        if ((saveData2.object(forKey: "name")) != nil) {
            DataArray = saveData2.array(forKey: "name")! as [AnyObject]
        }
        //機能拡張枠 内容変更
        if saveData2.object(forKey: "subject") != nil {
            S = saveData2.object(forKey: "subject") as! String!
        }
        
        if saveData2.object(forKey: "message") != nil {
            M = saveData2.object(forKey: "message") as! String!
        }
        table.reloadData()
        
        
        
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
            let nowIndexPathData: (AnyObject) = DataArray[indexPath.row]
        
            cell.textLabel!.text = nowIndexPathData["name"] as? String
            
            return cell
        
        
    }
    
    //実験用
    @IBAction func updata() {
        if ((saveData2.object(forKey: "name")) != nil) {
            DataArray = saveData2.array(forKey: "name")! as [AnyObject]
        }
        //機能拡張枠 内容変更
        if saveData2.object(forKey: "subject") != nil {
            S = saveData2.object(forKey: "subject") as! String!
        }
        
        if saveData2.object(forKey: "message") != nil {
            M = saveData2.object(forKey: "message") as! String!
        }
        table.dataSource = self
        table.delegate = self
        
        table.reloadData()
        

    }
    @IBAction func delete(){
        NSLog("00")
        if (select == false) {
            select = true
            NSLog("01")
            button.alpha = 0.1
        }else if (select == true) {
            let alertController3 = UIAlertController(title: naiyou, message: "", preferredStyle: .alert)
            
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {
                (action:UIAlertAction!) -> Void in
                
                self.saveData2.set(self.DataArray, forKey: "name")
                self.saveData2.synchronize()
                }
                
            )
            
            let cancelAction = UIAlertAction(title:  "NO", style: .default, handler:{
                (action:UIAlertAction!) -> Void in
                
            })
            
            alertController3.addAction(defaultAction)
            alertController3.addAction(cancelAction)
            present(alertController3, animated: true, completion: nil)

            self.select = false
            NSLog("02")
            button.alpha = 1
        }else{
            NSLog("error02")
        }
            }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (select == false){
            print("100")
            //func mailTapped(_ sender: AnyObject) {
                //メールが送信できるかどうかの確認は必ず必要
                if MFMessageComposeViewController.canSendAttachments()==false {
                    print("送れなかった")
                    return
                }
            let nowData : (AnyObject) = DataArray[indexPath.row]
            print("110")
            print(nowData["Email"] as Any)
                Atesaki[0][0] = nowData["Email"] as Any as! String
            print("111")
                let mail = MFMessageComposeViewController()
                mail.subject = S
                mail.body = M
                mail.recipients = Atesaki[0]
                
                
                
                self.present(mail,animated:  true,completion: nil)
                print("120")
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            print("121")
                mail.dismiss(animated: true, completion: nil)
            }
            //}
        }else if (select == true){
            print("101")
            DataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            
        }else{
            NSLog("error01" )
        }
        
    //ここからは追加や削除の設定は他のスクリプトに書きました
    
    }
    
    
    
    
    
}


