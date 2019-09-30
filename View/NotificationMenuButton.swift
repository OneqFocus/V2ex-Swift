//
//  NotificationButton.swift
//  V2ex-Swift
//
//  Created by huangfeng on 2/1/16.
//  Copyright © 2016 Fin. All rights reserved.
//

import UIKit

class NotificationMenuButton: UIButton {
    var aPointImageView:UIImageView?
	/*
	required修饰符只能用于修饰类初始化方法。
	当子类含有异于父类的初始化方法时（初始化方法参数类型和数量异于父类），
		子类必须要实现父类的required初始化方法，并且也要使用required修饰符而不是override。
	当子类没有初始化方法时，可以不用实现父类的required初始化方法。
	*/
    required init(){
        super.init(frame: CGRect.zero)
        self.contentMode = .center
        self.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        self.setImage(UIImage.imageUsedTemplateMode("ic_menu_36pt")!, for: UIControlState())
        
        self.aPointImageView = UIImageView()
        self.aPointImageView!.backgroundColor = V2EXColor.colors.v2_NoticePointColor
        self.aPointImageView!.layer.cornerRadius = 4
        self.aPointImageView!.layer.masksToBounds = true
        self.addSubview(self.aPointImageView!)
        self.aPointImageView!.snp.makeConstraints{ (make) -> Void in
            make.width.height.equalTo(8)
            make.top.equalTo(self).offset(3)
            make.right.equalTo(self).offset(-6)
        }
        
        self.kvoController.observe(V2User.sharedInstance, keyPath: "notificationCount", options: [.initial,.new]) {  [weak self](cell, clien, change) -> Void in
            if V2User.sharedInstance.notificationCount > 0 {
                self?.aPointImageView!.isHidden = false
            }
            else{
                self?.aPointImageView!.isHidden = true
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
