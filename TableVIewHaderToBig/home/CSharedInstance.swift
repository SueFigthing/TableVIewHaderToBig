//
//  CSharedInstance.swift
//  SwiftLisue
//
//  Created by lisue on 16/5/30.
//  Copyright © 2016年 lisue. All rights reserved.
//

import UIKit

class CSharedInstance: NSObject {
    var a:String?
    //  单例
    static let sharedInstance = CSharedInstance()
    
    //class 修饰 属于类方法  单例方法
    class func sSharedInstanc() -> CSharedInstance{
        
        return sharedInstance
    }
    
    
}
