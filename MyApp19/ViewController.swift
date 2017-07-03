//
//  ViewController.swift
//  MyApp19
//
//  Created by iii-user on 2017/7/3.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let gamedataFile = NSHomeDirectory() + "/Documents/gamedata.plist"
    let appMain = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func queryDB(_ sender: Any) {
        
        let sql = "SELECT * FROM cust"
        var point:OpaquePointer?
        if sqlite3_prepare(appMain.db, sql, -1, &point, nil) == SQLITE_OK{
            print("ok")
        }
        while sqlite3_step(point) == SQLITE_ROW{
            let cname = sqlite3_column_text(point, 1)
            
            print(String(cString: cname!))
        }
        
        
        
        
        
    }
    
     @IBOutlet weak var inputName: UITextField!

    @IBAction func saveName(_ sender: Any) {
        
        if let gdata = NSMutableDictionary(contentsOfFile: gamedataFile){
            gdata["name"] = inputName.text
            gdata["test"] = "Hello"
            gdata.write(toFile: gamedataFile, atomically: true)
        }
        
        
        
    }
       
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let gdata = NSMutableDictionary(contentsOfFile: gamedataFile){
            if let name = gdata["name"]{
            print(name)
            }
            if let test = gdata["test"]{
                print(test)
            }
//            print(gdata["name"] ?? "nobody")
//            print(gdata["stage"] ?? 0)
//            print(gdata["sound"] ?? true)
        
        
        }
        
    }

}

