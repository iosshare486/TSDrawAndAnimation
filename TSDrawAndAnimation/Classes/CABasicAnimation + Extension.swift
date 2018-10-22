//
//  CABasicAnimation + Extension.swift
//  TSDrawAndAnimation
//
//  Created by 小铭 on 2018/10/16.
//  Copyright © 2018年 caiqr. All rights reserved.
//  基础动画封装（位移，缩放，透明度渐变，旋转）

import UIKit

/// 基础动画KeyPath
public struct TSBasicAnimationKey {
    public static let kScaleAnimationKey: String = "transform.scale"
    public static let kPositionAnimationKey: String = "position"
    public static let kOpacityAnimationKey: String = "opacity"
    public static let kRotationAnimationKey: String = "transform.rotation.z"
    public static let kStrokeEndAnimationKey: String = "strokeEnd"
}

public extension CABasicAnimation {
    
    /// 位移动画
    ///
    /// - Parameters:
    ///   - fromeValue: 起始Value
    ///   - toValue: 结束Value
    ///   - duration: 动画时间
    /// - Returns:
    public class func positionAnimation (_ fromeValue : Any?,
                                   _ toValue : Any?,
                                   _ duration : CFTimeInterval = 0) -> CABasicAnimation {
        return addAnimation(TSBasicAnimationKey.kPositionAnimationKey, fromeValue, toValue, duration,1)
    }
    
    /// 缩放动画
    ///
    /// - Parameters:
    ///   - fromeValue: 起始Value
    ///   - toValue: 结束Value
    ///   - duration: 动画时间
    /// - Returns:
    public class func scaleAnimation (_ fromeValue : Any?,
                                      _ toValue : Any?,
                                      _ duration : CFTimeInterval = 0) -> CABasicAnimation {
        return addAnimation(TSBasicAnimationKey.kScaleAnimationKey, fromeValue, toValue, duration)
    }
    
    /// 透明度动画
    ///
    /// - Parameters:
    ///   - fromeValue: 起始Value
    ///   - toValue: 结束Value
    ///   - duration: 动画时间
    /// - Returns:
    public class func opacityAnimation (_ fromeValue : Any?,
                                  _ toValue : Any?,
                                  _ duration : CFTimeInterval = 0) -> CABasicAnimation {
        return addAnimation(TSBasicAnimationKey.kOpacityAnimationKey, fromeValue, toValue, duration)
    }
    
    /// 旋转动画
    ///
    /// - Parameters:
    ///   - fromeValue: 起始Value
    ///   - toValue: 结束Value
    ///   - duration: 动画时间
    /// - Returns:
    public class func rotationAnimation (_ fromeValue : Any?,
                                         _ toValue : Any?,
                                         _ duration : CFTimeInterval = 0) -> CABasicAnimation {
        return addAnimation(TSBasicAnimationKey.kRotationAnimationKey, fromeValue, toValue, duration)
    }
    
    /// 绘制轨迹动画
    ///
    /// - Parameters:
    ///   - fromeValue: 起始Value
    ///   - toValue: 结束Value
    ///   - duration: 动画时间
    /// - Returns:
    public class func strokeEndAnimation (_ fromeValue : Any?,
                                          _ toValue : Any?,
                                          _ duration : CFTimeInterval = 0) -> CABasicAnimation {
        ///绘制动画只绘制一次。 并且绘制后移除。
        let strokeAnimation : CABasicAnimation = addAnimation(TSBasicAnimationKey.kStrokeEndAnimationKey, fromeValue, toValue, duration,1)
        strokeAnimation.isRemovedOnCompletion = true
        strokeAnimation.fillMode = CAMediaTimingFillMode.removed
        return strokeAnimation
    }
    
    ///内部方法配置动画
    private class func addAnimation (_ keyPath : String,
                                     _ fromeValue : Any?,
                                     _ toValue : Any?,
                                     _ duration : CFTimeInterval,
                                     _ repeatCount : Float = HUGE) -> CABasicAnimation {
        let animation : CABasicAnimation = CABasicAnimation.init(keyPath: keyPath)
        animation.duration = duration
        animation.fromValue = fromeValue
        animation.toValue = toValue
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = repeatCount
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        return animation
    }
}
