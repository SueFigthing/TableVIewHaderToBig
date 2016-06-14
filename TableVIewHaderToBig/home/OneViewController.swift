//
//  OneViewController.swift
//  SwiftLisue
//
//  Created by lisue on 16/5/18.
//  Copyright © 2016年 lisue. All rights reserved.
//

import UIKit

@objc public protocol OneViewCDelgate : NSObjectProtocol {
    
    func getTextName(textName:String)
    optional  func getTextName2(textName:String)
}



//对于闭包 我们用来做会掉函数
//typealias 相当于OC的typede
typealias InputClosureType = (String) -> Void   //定义闭包类型（特定的函数类型函数类型）
class OneViewController: UIViewController {
    
    weak var delegatV:OneViewCDelgate?
    
    
    
    var backClosure:InputClosureType?           //接收上个页面穿过来的闭包块
    var strName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sjar = CSharedInstance.sSharedInstanc()
        sjar.a = "ffff"
        print("==\(sjar.a)")
        
        let math = Math(text: "mmmmm") { [weak self](isa) in
            if isa {
                self?.strName = "ggggg"
                print("=====11111")
            }else{
                print("=====222222")
            }
            
        }
        
        math.chenese()
        
        
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        
        for item in library {
            if let movie = item as? Movie {
                print("Movie: '\(movie.name)', dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: '\(song.name)', by \(song.artist)")
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("你好", object: "参数")
        
        
        
        self.title = "另一盒"
        self.backClosure!("你哈你你你你你你")
        print("======\(self.strName)")
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        back()
        
    }
    
    deinit {
        print("======\(self.strName)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //闭包变量的Seter方法
    func setBackMyClosure(tempClosure:InputClosureType) {
        self.backClosure = tempClosure
    }
    
    func setstrName(tmepstr:String) {
        print("======\(tmepstr)")
        self.strName = tmepstr
        
    }
    
    
    func back() {
        
        self.delegatV?.getTextName("你就好的环境就将计就计")
        
    }
    
}


class Math: NSObject {
    let textN :String
    var push:(Bool)->Void?
    //
    init(text:String,push:(Bool)->Void) {
        self.textN = text
        self.push = push
    }
    
    func chenese(){
        print(self.textN)
        self.push(true)
    }
    
    
}

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}


class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}


// 代理点击的协议
protocol ButtonDelegate {
    func onButtonTap(sender: UIButton)
}

class ViewWithTextAndButton: UIView {
    
    // 保存代理，后面使用
    var delegate: ButtonDelegate?
    
    func onButtonTap(sender: UIButton) {
        // 按钮被点击的时候调用代理
        delegate?.onButtonTap(sender)
    }
}