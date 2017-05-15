//
//  SolarTransitionExecutor.swift
//  Pods
//
//  Created by Matija Kruljac on 1/29/17.
//
//

import Foundation
import UIKit

public enum TransitionType {
    case presenting, dismissing
    
    var value: Bool {
        switch self {
        case .presenting:
            return true
        case .dismissing:
            return false
        }
    }
}

public class SolarTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration: TimeInterval
    var isPresenting: Bool
    var originView: UIView
    
    public init(withDuration duration: TimeInterval, forTransitionType type: TransitionType, originView: UIView) {
        self.duration = duration
        self.isPresenting = type.value
        self.originView = originView
        
        super.init()
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toViewConroller = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        
        guard let fromView = fromViewController.view else { return }
        guard let toView = toViewConroller.view else { return }
    
        if isPresenting {
            presentViewControllerAnimated(withFromView: fromView, withToView: toView, withContainerView: containerView, andWithTransitionContext: transitionContext)
        } else {
            dismissViewControllerAnimated(withFromView: fromView, withToView: toView, withContainerView: containerView, andWithTransitionContext: transitionContext)
        }
        
    }
    
}
