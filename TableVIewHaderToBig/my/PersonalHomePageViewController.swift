//
//  PersonalHomePageViewController.swift
//  SwiftLisue
//
//  Created by lisue on 16/6/13.
//  Copyright © 2016年 lisue. All rights reserved.
//

import UIKit
let kDefaultTableViewHeaderMargin = CGFloat(40.0)
let kDefaultImagePagerHeight = CGFloat(260.0)
let kDefaultImageScalingFactor = CGFloat(160.0)
let kDefaultImageAlpha = CGFloat(0.2)

class PersonalHomePageViewController: UIViewController {
    var  scrollViewDragPoint = CGPoint()
    var imageView = UIImageView()
    var imageScalingFactor = kDefaultImageScalingFactor
    var _navBarFadingOffset = CGFloat()
    var  headerImageAlpha  = kDefaultImageAlpha
    var imageHeaderViewHeight = kDefaultImagePagerHeight
    var _adsScrollViewContainer :UIView?
    var _tableHeader :UIView?
    var tableView = UITableView(frame: CGRectZero, style: .Grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.alpha = 0
        
        _navBarFadingOffset = imageHeaderViewHeight - (64 + kDefaultTableViewHeaderMargin);
        
        createTableView()
        tableviewHeder()
        
        //监听表的contentOffset
        var context = bridge(self)
        self.tableView.addObserver(self, forKeyPath: "contentOffset" , options: .New, context:&context)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
    }
    
    
    /*
     MARK: -私有方法
     */
    func createTableView() -> Void {
        self.tableView.frame = self.view.bounds;
        self.view.addSubview(self.tableView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.registerClass(LoginTableViewCell.classForCoder(), forCellReuseIdentifier: "cellIdentifier")
        
        let _footer = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44+20));
        _footer.backgroundColor = UIColor.clearColor();
        self.tableView.tableFooterView = _footer;
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    func tableviewHeder() -> Void {
        _tableHeader = nil;
        
        _tableHeader = UIView(frame: CGRectZero)
        addScrollingAdsViewContainer()
        
        _tableHeader?.frame =  CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 270);
        _tableHeader!.backgroundColor = UIColor.clearColor();
        self.tableView.tableHeaderView = _tableHeader!;
        
    }
    
    func addScrollingAdsViewContainer() -> Void {
        if (_adsScrollViewContainer != nil) {
            _adsScrollViewContainer?.removeFromSuperview()
            _adsScrollViewContainer = nil
        }
        
        let _adsSVContainer = UIView(frame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), self.imageHeaderViewHeight - kDefaultTableViewHeaderMargin));
        _adsScrollViewContainer = _adsSVContainer;
        _adsScrollViewContainer!.backgroundColor = UIColor.clearColor();
        _tableHeader!.addSubview(_adsScrollViewContainer!)
        _tableHeader!.backgroundColor = UIColor.redColor()
        
        let _imgBG = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), imageHeaderViewHeight));
        _imgBG.image = UIImage.init(named: "bg_img")
        self.imageView = _imgBG;
        self.view.insertSubview(self.imageView, belowSubview: self.tableView)
    }
    
    func bridge<T : AnyObject>(obj : T) -> UnsafeMutablePointer<Void> {
        return UnsafeMutablePointer(Unmanaged.passUnretained(obj).toOpaque())
        // return unsafeAddressOf(obj) // ***
    }
    
}

/*
 MARK: - 表的代理方法
 */

extension PersonalHomePageViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! LoginTableViewCell
        
        
        //        //attributedPlaceholder设置 UITextField 的placehoder 的属性 修改其颜色 大小 字体等
        let  placehoder = NSAttributedString(string:"ppppppppppppppppp", attributes: [NSForegroundColorAttributeName:UIColor.yellowColor() ,NSFontAttributeName:UIFont.systemFontOfSize(14)])
        cell.textF!.attributedPlaceholder = placehoder
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
}

/*
 MARK: - 设置拉缩的动画效果
 */
extension PersonalHomePageViewController{
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        
        if object === self.tableView && keyPath == "contentOffset"{
            scrollViewDidScrollWithOffset(self.tableView.contentOffset.y)
            
        }else{
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
            return;
        }
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.scrollViewDragPoint = scrollView.contentOffset
    }
    
    func scrollViewDidScrollWithOffset(scrollOffset:CGFloat) -> Void {
        let scrollViewDragPoint = self.scrollViewDragPoint;
        if scrollOffset<0 {
            self.imageView.transform = CGAffineTransformMakeScale(1 - (scrollOffset / self.imageScalingFactor), 1 - (scrollOffset / self.imageScalingFactor))
            
        }else{
            self.imageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            var newFrame = self.tableView.tableFooterView!.frame;
            newFrame.size.height = scrollOffset;
            self.tableView
                .tableFooterView!.frame = newFrame
        }
        
        animateImageView(scrollOffset, scrollViewDragPoint: scrollViewDragPoint, alpha: self.headerImageAlpha)
    }
    
    func animateImageView(scrollOffset:CGFloat,scrollViewDragPoint:CGPoint,alpha:CGFloat) -> Void {
        animateNavigationBar(scrollOffset, scrollViewDragPoint: scrollViewDragPoint)
        if scrollOffset > scrollViewDragPoint.y && scrollOffset > kDefaultTableViewHeaderMargin{
            UIView.animateWithDuration(0.3, animations: {
                self.imageView.alpha = alpha
            })
        }
        else if scrollOffset <= kDefaultTableViewHeaderMargin{
            UIView.animateWithDuration(0.3, animations: {
                self.imageView.alpha = 1.0;
            })
        }
        
    }
    
    func animateNavigationBar(scrollOffset:CGFloat,scrollViewDragPoint:CGPoint) -> Void {
        if scrollOffset>_navBarFadingOffset && self.navigationController?.navigationBar.alpha == 0.0 {
            self.navigationController?.navigationBar.alpha = 0
            UIView.animateWithDuration(0.3, animations: {
                self.navigationController?.navigationBar.alpha = 1
            })
        } else if scrollOffset < _navBarFadingOffset && self.navigationController?.navigationBar.alpha == 1.0{
            
            UIView.animateWithDuration(0.3, animations: {
                self.navigationController?.navigationBar.alpha = 0.0
            })
        }
    }
}