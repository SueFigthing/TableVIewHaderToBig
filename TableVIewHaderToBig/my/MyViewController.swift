//
//  MyViewController.swift
//  SwiftLisue
//
//  Created by lisue on 16/5/17.
//  Copyright © 2016年 lisue. All rights reserved.
//

import UIKit

public protocol MYVCDelegate:NSObjectProtocol{
    func myDage(str:String) -> Void
    
}


@objc protocol GoodsListCellDeleDate:NSObjectProtocol{
    
    optional func Cell(cell:NSObject)
}

class MyViewController: UIViewController {
    
    var btn:UIButton?
    var tableView:UITableView?
    //    var btn :UIButton?
    weak var deledate:GoodsListCellDeleDate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "my"
        self.view.backgroundColor = UIColor.yellowColor()
        let a =  A(name: "tom")
        
        a.sayHello1()
        a.sayHello()
        
        blockA("pppp") { (name2) in
            print("===\(name2)")
        }
        btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn?.backgroundColor = UIColor.redColor()
        btn?.addTarget(self, action:#selector(MyViewController.btnAction), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn!)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnAction() -> Void {
        let per =  PersonalHomePageViewController()
        per.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(per, animated: true)
    }
    
    func tapClick(){
        
        deledate?.Cell!("=======")
        
    }
    
    func blockA(name1:String,closure: (name2:String) -> Void) {
        
        closure(name2: name1)
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

class A: NSObject {
    var _name :String?
    init(name:String) {
        _name = name
    }
    func sayHello() {
        print("\(_name)say hello word")
    }
    
}

extension A{
    
    func sayHello1() {
        print("\(_name)say hi to jane")
    }
    
}