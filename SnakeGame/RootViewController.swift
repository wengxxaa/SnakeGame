//
//  RootViewController.swift
//  SnakeGame
//
//  Created by wanglichun on 15/10/19.
//  Copyright © 2015年 thunder. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var mainBoard: MainBoard?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.title = "简易贪吃蛇";
        self.configureNavigationItem()
        
        let width: CGFloat = UIScreen.mainScreen().bounds.width
        let height: CGFloat = UIScreen.mainScreen().bounds.height - 66
        self.mainBoard = MainBoard(parent: self.view, width: width, height: height)
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldAutorotate() -> Bool {
        return self.mainBoard?.isGamePlaying == false
    }

    // MARK: - Private
    
    func configureNavigationItem()
    {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "排行", style: UIBarButtonItemStyle.Plain, target: self, action: "onRankButtonClicked:")
        
        let startButton = UIBarButtonItem(title: "开始", style: UIBarButtonItemStyle.Plain, target: self, action: "onStartGameButtonClicked:")
        let settingButton = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.Plain, target: self, action: "onSettingButtonClicked:")
        self.navigationItem.rightBarButtonItems = [settingButton, startButton]
    }
    
    // MARK: - Button actions
    
    func onStartGameButtonClicked(sender: UIButton)
    {
        if self.mainBoard?.isGamePlaying == false {
            let width: CGFloat = UIScreen.mainScreen().bounds.width
            var height: CGFloat = UIScreen.mainScreen().bounds.height
            if self.view.frame.width > self.view.frame.height {
                height -= 32
            } else {
                height -= 66
            }
            self.mainBoard?.setSize(width: width, height: height)
            self.mainBoard?.startGame()
        }
    }
    
    func onRankButtonClicked(sender: UIButton)
    {
        print("排行点击")
        let controller = RankViewController(nibName:"RankViewController", bundle:nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func onSettingButtonClicked(sender:UIButton)
    {
        print("设置点击")
        let controller = RankViewController(nibName:"SettingViewController", bundle:nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    }
