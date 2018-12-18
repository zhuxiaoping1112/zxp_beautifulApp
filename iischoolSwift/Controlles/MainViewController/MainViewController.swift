//
//  MainViewController.swift
//  iischoolSwift
//
//  Created by junke on 2018/12/18.
//  Copyright © 2018 hank. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIConstant.COLOR_APPNORMAL
        //初始化控制器
        intRootViewController()
        //添加覆盖层
        addCoverView()
        
        leftMenuShowAnimate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    //Mark  --------------Getter and  Setter------------------
    fileprivate var menuControlller: MenuController!
    fileprivate var homeController: HomeController?
    fileprivate var findAppController: FindAppDetailController?
    fileprivate var currentController: UIViewController!
    fileprivate let menuMaxWidth: CGFloat = 0.8*UIConstant.SCREEN_WIDTH
    fileprivate weak var cover: UIWindow!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MainViewController{
    fileprivate func intRootViewController (){
        menuControlller = MenuController()
        menuControlller.view.frame = CGRect(x: 0, y: 0, width: menuMaxWidth, height: UIConstant.SCREEN_HEIGH)
        homeController = HomeController()
        currentController = homeController
        currentController?.view.frame = self.view.bounds
        
        addChild(menuControlller)
        addChild(currentController)
        
        view.addSubview(menuControlller.view)
        view.addSubview(currentController.view)
    }
    
    fileprivate func addCoverView(){
        let cover = UIWindow(frame: currentController.view.frame)
        let pan  = UIPanGestureRecognizer(target: self, action: #selector(MainViewController.leftMenuDidDrag(pan:)))
        
        cover.backgroundColor = UIColor(red: 254/255.0, green: 254/255.0, blue: 245/255.0, alpha: 0.02)
        cover.addGestureRecognizer(pan)
        self.cover = cover
        currentController.view.addSubview(cover)
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainViewController.leftMenuShowAnimate))
        cover.addGestureRecognizer(tap)
        self.view.bringSubviewToFront(cover)
        
    }
    
    @objc fileprivate func leftMenuDidDrag(pan : UIPanGestureRecognizer){
        let point = pan.translation(in: pan.view)
        if (pan.state == .cancelled || pan.state == .ended) {
            self.leftMenuShowAnimate()
        }else{
            currentController.view.x += point.x
            pan.setTranslation(CGPoint.zero, in: currentController.view)
        }
    }
    
    @objc fileprivate func leftMenuShowAnimate(){
        currentController.traitCollection.containsTraits(in: <#T##UITraitCollection?#>)
    }
    
}
