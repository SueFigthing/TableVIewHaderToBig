//
//  LoginViewController.swift
//  SwiftLisue
//
//  Created by lisue on 16/5/31.
//  Copyright © 2016年 lisue. All rights reserved.
//

import UIKit
class LoginTableViewCell: UITableViewCell {
    
    var textF:UITextField?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let rect = CGRect(x: 20, y: 10, width: 300, height: 40)
        
        textF = UITextField(frame: rect)
        textF!.textColor = UIColor.blueColor()
        textF!.backgroundColor = UIColor .redColor()
        self.addSubview(self.textF!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LoginViewController: UIViewController {
    var placeholderAy = ["账号/用户名","密码"]
    var myTableView :UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView = UITableView(frame: self.view.frame, style: .Plain)
        myTableView?.dataSource = self
        myTableView?.delegate = self
        myTableView?.registerClass(LoginTableViewCell.classForCoder(), forCellReuseIdentifier: "cellIdentifier")
        self.view.addSubview(myTableView!)
        myTableView?.backgroundColor = UIColor.orangeColor()
        myTableView?.tableHeaderView = tableViewHeader()
        myTableView?.tableFooterView = tableviewFooter()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableViewHeader() -> UIView {
        
        let view = UIView(frame:  CGRect(x: 0, y: 0, width: CGRectGetWidth(self.view.frame), height: 150))
        
        let imageVC = UIImageView(frame:  CGRect(x: 100, y: 0, width: 100, height: 50))
        view.addSubview(imageVC)
        imageVC.backgroundColor = UIColor .yellowColor()
        
        let titleLB = UILabel(frame: CGRect(x: 100, y: CGRectGetHeight(imageVC.frame), width: CGRectGetWidth(self.view.frame), height: 20))
        titleLB.font = UIFont.systemFontOfSize(18)
        titleLB.text = "能否能快速打开就能付款交罚款"
        view.addSubview(titleLB)
        
        return view
    }
    
    func tableviewFooter() -> UIView {
        let view = UIView(frame:  CGRect(x: 0, y: 0, width: CGRectGetWidth(self.view.frame), height: 150))
        let wid = (CGRectGetWidth(self.view.frame)-200)/3.0
        for i in 0...1 {
            let btn = UIButton(type: .Custom)
            let margin =  CGFloat(i)*(wid+CGFloat(100))+wid
            
            btn.frame = CGRect(x:margin, y: 20, width: 100, height: 40)
            view.addSubview(btn)
            
            btn.backgroundColor = UIColor.redColor()
            
        }
        
        
        
        return view
    }
}



extension LoginViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! LoginTableViewCell
        
        //attributedPlaceholder设置 UITextField 的placehoder 的属性 修改其颜色 大小 字体等
        let  placehoder = NSAttributedString(string:placeholderAy[indexPath.row], attributes: [NSForegroundColorAttributeName:UIColor.yellowColor() ,NSFontAttributeName:UIFont.systemFontOfSize(14)])
        
        cell.textF!.attributedPlaceholder = placehoder
        cell.textF!.delegate = self;
        
        return cell
        
    }
    
}
extension LoginViewController :UITextFieldDelegate{
    
}