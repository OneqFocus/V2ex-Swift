//
//  BaseModel.swift
//  V2ex-Swift
//
//  Created by huangfeng on 1/13/16.
//  Copyright © 2016 Fin. All rights reserved.
//

import UIKit

import ObjectMapper
import Ji
// 简单的网络请求类
import Moya

// Mappable 支持嵌套转换
// Map --- A class used for holding mapping data
class BaseJsonModel: Mappable {
	// required 强制子类重写此方法
	// 重写父类的required init方法，前面不用加override
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
    }
}

// JiNode xml节点
protocol BaseHtmlModelProtocol {
    init(rootNode:JiNode)
}

/// 实现这个协议的类，可用于Moya自动解析出这个类的model的对象数组
protocol HtmlModelArrayProtocol {
    static func createModelArray(ji:Ji) -> [Any]
}

/// 实现这个协议的类，可用于Moya自动解析出这个类的model的对象
protocol HtmlModelProtocol {
    static func createModel(ji:Ji) -> Any
}
