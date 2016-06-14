//
//  HomeViewController.swift
//  SwiftLisue
//
//  Created by lisue on 16/5/17.
//  Copyright © 2016年 lisue. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,OneViewCDelgate {
    
    var btn:UIButton?
    
    var ay = ["web","html","ios","Android"]
    //初始化一个空字典[key:value] 例如OC的NSDictionary
    var datDic = [String:String]()
    //    可变数组
    var dic = NSMutableDictionary()
    
    var mutableAy = NSMutableArray()
    private var articles1 = [String:[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.title = "home"
        self.view.backgroundColor = UIColor.yellowColor()
        
        
        btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn?.backgroundColor = UIColor.redColor()
        btn?.addTarget(self, action:#selector(HomeViewController.btnAction), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn!)
        //        doSemaphore()
        //        let queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        //        dispatch_sync(queue_t) {
        //
        //            for i in 0...100000{
        //               print("dispatch_sync====\(i)")
        //            }
        //
        //        }
        ////        dispatch_barrier_sync(queue_t) {
        ////            print("dispatch_barrier_sync====1")
        ////        }
        ////        dispatch_barrier_sync(queue_t) {
        ////            print("dispatch_barrier_sync====2")
        ////        }
        //        dispatch_sync(queue_t) {
        //            print("dispatch_sync==000==2")
        //        }
        
        /*
         ************数组的用法********
         
         //对数组的遍历的方法
         for item in ay {
         
         print("====>\(item)")
         }
         
         for (index,value) in ay.enumerate()
         {
         
         print("------->>\(index):\(value)")
         }
         */
        
        
        
        /*
         ************字典的用法********
         
         dic.setObject("varf", forKey: "oooo")
         
         
         dic.setObject("varf==", forKey: "oooo11")
         
         for (key,value) in dic {
         print("------->>\(key):\(value)")
         }
         
         
         //字典
         datDic = ["jj":"keyvalue"]
         print(datDic)
         
         datDic["jj"] = "jane"
         print(datDic)
         
         
         //字典的遍历
         
         
         for (key,value) in datDic {
         print("------->>\(key):\(value)")
         }
         
         
         let ayDic = NSDictionary(object: "nihao", forKey: "jfjfjj")
         
         print(ayDic)
         
         ********************************************
         */
        
        
        
        
        //      类方法的调用 HomeViewController.B(34)
        
        
        /*
         ***********嵌套方法
         let arr = [20,12,2,1,23,24,3]
         let v = hasAnyMatch(arr, condition: lessThanTen)
         print("[[[[==\(v)==]]]")
         
         */
        
        
        /*      fallthrough 的用法
         
         fallthrough 的语法是紧跟着case语句
         在Swift的switch中，case后面加了fallthrough的用法，就和OC的case后面没加break的用法是一样的！
         加了fallthrough语句后，【紧跟的后一个】case条件不能定义常量和变量
         let age = 10
         switch age {
         case 0...10:
         print("小朋友")
         fallthrough
         print("我跳转了哦") //这一句没有执行
         case 11...20:
         print("大朋友")
         case let x:
         print("\(x)岁的朋友")
         }
         
         这里输出 小朋友
         大朋友
         */
        
        /*
         
         *******is as 的用法
         is 相当于 oc的 isKindClass
         as 强制转换某种类型
         
         for view : AnyObject in self.view.subviews
         {
         if view is UIButton
         {
         let btn = view as! UIButton;
         print(btn)
         }
         }
         
         */
        
        /*
         *******关键字******
         
         #column 列号
         #file 路径
         #function 函数
         #line 行号
         print("__COLUMN__=\(#column)\n __FILE__\(#file)\n__FUNCTION__=\(#function)\n __LINE__\(#line)")
         */
        
        
        
        /*
         @objc 是oc中也能调用
         ********************* swift代理****************
         
         代理的定义
         public protocol OneViewCDelgate : NSObjectProtocol {
         func getTextName(textName:String)
         
         }
         
         属性的弱引用的定义
         weak var delegatV:OneViewCDelgate?
         
         注意 在类时使用该代理的时候 calss 头一定要实现协议
         class HomeViewController: BaseViewController ,OneViewCDelgate
         
         然后一定要实现代理的协议方法  func getTextName
         
         代理中默认的情况下 代理方法是必须要实现的
         如果改成可选择的实现方式 应该把类改成如下方式  ---》加上@objec
         
         @objc public protocol OneViewCDelgate : NSObjectProtocol {
         
         func getTextName(textName:String)
         optional  func getTextName2(textName:String)
         }
         
         optional 关键字是可选择的实现该代理方法
         
         
         推荐下面的操作方式
         class MyViewcontroller: UIViewController {
         // class stuff here
         }
         // MARK: - UITableViewDataSource
         extension MyViewcontroller: UITableViewDataSource {
         // table view data source methods
         }
         // MARK: - UIScrollViewDelegate
         extension MyViewcontroller: UIScrollViewDelegate {
         // scroll view delegate methods
         }
         
         
         */
        
        /*
         *****************block*********************
         
         swift的block是利用闭包的方式实现的
         
         全局的闭包定义
         //typealias 相当于OC的typede
         typealias InputClosureType = (String) -> Void   //定义闭包类型（特定的函数类型函数类型）
         
         闭包的格式
         closure: (parameters) -> Void
         
         实现表达式
         { (parameters) -> returnType in
         statements
         }
         
         
         类的回调方法
         func blockA(name1:String,closure: (name2:String) -> Void) {
         
         closure(name2: name1)
         }
         
         调用时 blockA("pppp") { (name2) in
         print("===\(name2)")
         }
         
         
         */
        
        
        
        /*
         *****************通知的学习*********************
         object 传入的参数
         
         
         NSNotificationCenter.defaultCenter().postNotificationName("你好", object: "参数")
         
         //监听你好这个观察者
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.notificationAction(_:)), name: "你好", object: nil)
         
         
         func notificationAction(title:NSNotification) -> Void {
         
         let str = title.object as! String
         
         
         print("=========\(str)===")
         }
         
         
         移除通知
         
         NSNotificationCenter.defaultCenter().removeObserver(self, name: "你好", object: nil)
         
         */
        
        
        /*
         ***********************delloc******************************
         oc 的delloc 相当于 swift的 deinit
         直接deinit{}
         
         */
        
        
        /*
         ***********************KVO******************************
         自己百度
         
         */
        
        /*
         ***********************set get方法******************************
         为了保持简洁，如果一个计算属性是只读的，请忽略掉get语句。只有在需要定义set语句的时候，才提供get语句。
         简写时，新赋的值默认为newValue
         
         class Calcuator1{
         var a:Int = 1;
         var b:Int = 1;
         
         var sum:Int{
         get{
         return a + b
         }
         set(val){
         print("======")
         b = val - a
         }
         }
         }
         
         let cal = Calcuator1();
         print(cal.sum) //2
         cal.sum = 5
         print(cal.b) //4
         
         
         
         //如果只要get，不要set方法时可以简写成如下代码
         class Calcuator{
         var a:Int = 1;
         var b:Int = 1;
         
         var sum:Int{
         return a + b
         }
         }
         let b = Calcuator()
         print(b.sum)
         
         */
        
        /*
         ***********************单例类******************************
         
         OC的
         + (instancetype)sharedInstance {
         static Kraken *sharedInstance = nil;
         static dispatch_once_t onceToken;
         
         dispatch_once(&onceToken, ^{
         sharedInstance = [[Kraken alloc] init];
         });
         return sharedInstance;
         }
         
         swift
         class TheOneAndOnlyKraken {
         static let sharedInstance = TheOneAndOnlyKraken()
         }
         
         let sjar = CSharedInstance.sSharedInstanc()
         sjar.a = "ffff"
         print("==\(sjar.a)")
         
         let s = CSharedInstance.sSharedInstanc()
         
         print("==\(s.a)")
         
         
         //仿照apple   NSNotificationCenter.defaultCenter()
         
         */
        
        /*
         ***********************init******************************
         重写init
         
         1：如果init前面用required关键字来修饰的话 那么他的子类就必须要实现该init的方法
         父类 eg：
         required init(num: Int) {
         numA = num
         }
         
         子类 eg:
         required init(num: Int) {
         super.init(num: num)
         }
         
         2:如果init 前面是用convenience 关键字的话 convenience的初始化方法是不能被子类重写或从子类中以super的方式被调用的。
         
         3：override 修饰init 是重写父类的init方法
         
         */
        
        /*
         ***********************swift与OC测混编******************************
         
         1:创建swift与OC混编的额桥梁  xxx-header.h桥接头文件 在Building Settings---》Object-C Bridging Header 导入该.h的路径
         
         如何想在swift文件里混编OC的文件 就要把想用的OC的头文件 导入到xxx-header.h
         
         2：系统会自动生成xxx.swift.h文件 支持OC里混编swift的文件
         
         只要在oc 导入xxx.swift.h文件 即可
         
         */
        
        
        
        
        //      let alert =  UIAlertView(title:"", message: s.a, delegate: nil, cancelButtonTitle: "quxiao")
        //        alert.show()
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //        let s = CSharedInstance.sSharedInstanc()
        //        let alertVC = UIAlertController(title: nil, message: s.a, preferredStyle: .Alert)
        //        alertVC.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: { (UIAlertAction) in
        //
        //            alertVC.dismissViewControllerAnimated(false, completion: {
        //
        //            })
        //        }))
        
        
        //        self.navigationController?.presentViewController(alertVC, animated: true, completion: {
        //
        //
        //
        //        })
        //
    }
    
    func btnAction(){
        
        //
        //      let w =  detilData("ss", afterStr: "ss", sort: sort1)
        //        print("[[[[==\(w)==]]]")
        
        
        //       var one : OneViewController?
        //
        //        one = OneViewController()
        //
        //       one!.delegatV = self
        //        //实现回调，接收回调过来的值
        //        one!.setBackMyClosure { (inputText:String) -> Void in
        //           print("======\(inputText)")
        //        }
        //        one!.setstrName("pppppppppp")
        //
        //        self.hidesBottomBarWhenPushed = true
        //        self.navigationController?.pushViewController(one!, animated: true)
        //
        //        let vv = AViewController();
        //        vv.name = "nihao"
        //        vv.passWord = "123456"
        //        self.navigationController?.pushViewController(vv, animated: true)
        
        let login = LoginViewController()
        self.navigationController?.presentViewController(login, animated: true, completion: {
            
        })
        
    }
    
    
    func getTextName(textName:String){
        print(textName)
    }
    
    //*******************闭包*******************
    
    
    // 注意: 如果写成var complete : (String) -> ()?, 不包含大括号,则编译器会解析成闭包的返回值为可选类型
    
    // 闭包的格式: (参数列表) -> (返回值类型)
    func loadData(complete : (String) -> ()) {
        
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            
            print("\(NSThread.currentThread()): 正在请求数据")
            
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                
                print("\(NSThread.currentThread()): 请求到数据,并且准备进行回调")
                
                // 回调闭包
                complete("JSON数据")
                
            })
            
        }
    }
    
    //*******************闭包*******************
    
    
    func detilData(befStr:String,afterStr:String,sort:(String,String) -> Bool)->String {
        
        if sort(befStr,afterStr) {
            
            return "hi"
        }
        
        return "hello"
    }
    
    func sort1(s1:String,s2:String) -> Bool {
        
        if s1==s2 {
            return true
        }
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func bigMax(newM:String,oldM:String) -> Bool {
        
        if newM == oldM{
            return true
        }
        return false
        
    }
    
    
    //嵌套函数
    
    func hasAnyMatch(list:[Int],condition:Int ->Bool) -> Bool {
        
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    
    func lessThanTen(number: Int) -> Bool {
        return number <= 10;
    }
    
    //*******************类方法*******************
    //    类方法的 相当于OC的+方法  关键字class/static
    //    结构体struct和枚举enum的静态属性，静态方法使用static关键字
    //    类class的类型属性，类型方法使用class关键字
    class func B(number:Int)->String{
        
        if number>100 {
            return "ios"
        }
        return "swift"
    }
    //    *******************类方法*******************
    
    
    
    func doSemaphore() -> Void {
        
        print("=====dispatch_semaphore 信号量=====")
        //dispatch_semaphore_signal 信号量+1;
        //dispatch_semaphore_wait 信号量-1, 当变为0后如果是DISPATCH_TIME_FOREVER，则永远等待;
        
        
        let semaphore = dispatch_semaphore_create(10);//为了让一次输出10个，初始信号量为10；
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        for  i in 0...100
        {
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);//每进来1次，信号量-1;进来10次后就一直hold住，直到信号量大于0；
            dispatch_async(queue, {
                print(i)
                sleep(2);
                dispatch_semaphore_signal(semaphore);//由于这里只是log,所以处理速度非常快，我就模拟2秒后信号量+1;
            })
            
            
        }
        //IOS 6 ARC自动管理 dispatch_release(semaphore);
        
        //这个demo的使用场景是为了防止并发数过多导致系统资源吃紧。
        //在这里不得不提到并发的真实工作原理，以单核CPU做并发为例，一个CPU永远只能干一件事情，那如何同时处理多个事件呢，聪明的内核工程师让CPU干第一件事情，一定时间后停下来，存取进度，干第二件事情以此类推，所以如果开启非常多的线程，单核CPU会变得非常吃力，即使多核CPU，核心数也是有限的，所以合理分配线程，变得至关重要。
        //讲到这也不得不提如何高效的发挥多核CPU的性能，如果让一个核心模拟传很多线程，经常干一半放下干另一件事情，那效率也会变低，所以我们要合理安排，将单一任务或者一组相关任务并发至全局队列中运算或者将多个不相关的任务或者关联不紧密的任务并发至用户队列中运算。
    }
    
}



