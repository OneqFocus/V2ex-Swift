//
//  UIImage+Extension.swift
//  V2ex-Swift
//
//  Created by huangfeng on 2/3/16.
//  Copyright © 2016 Fin. All rights reserved.
//

import UIKit

extension UIImage {
    
    func roundedCornerImageWithCornerRadius(_ cornerRadius:CGFloat) -> UIImage {
        
        let w = self.size.width
        let h = self.size.height

        var targetCornerRadius = cornerRadius
        if cornerRadius < 0 {
            targetCornerRadius = 0
        }
        if cornerRadius > min(w, h) {
            targetCornerRadius = min(w,h)
        }
        
        let imageFrame = CGRect(x: 0, y: 0, width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        
        UIBezierPath(roundedRect: imageFrame, cornerRadius: targetCornerRadius).addClip()
        self.draw(in: imageFrame)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }
    
    class func imageUsedTemplateMode(_ named:String) -> UIImage? {
        let image = UIImage(named: named)
        if image == nil {
            return nil
        }
		// 设置图片的渲染模式
		/*
		automatic // Use the default rendering mode for the context where the image is used
		alwaysOriginal // Always draw the original image, without treating it as a template
		alwaysTemplate // Always draw the image as a template image, ignoring its color information
		*/
        return image!.withRenderingMode(.alwaysTemplate)
    }
}
