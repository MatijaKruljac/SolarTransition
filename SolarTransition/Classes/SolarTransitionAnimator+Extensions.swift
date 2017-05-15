//
//  UIViewController+Extensions.swift
//  Pods
//
//  Created by Matija Kruljac on 1/29/17.
//
//

import Foundation
import UIKit

extension SolarTransitionAnimator: UIViewControllerTransitioningDelegate {
    
    public func present(viewController toViewController: UIViewController, inNavigationController navigationController: UINavigationController) {
        toViewController.transitioningDelegate = self
        toViewController.modalPresentationStyle = .custom
        navigationController.present(toViewController, animated: true, completion: nil)
    }
    
    public func dismiss(viewController: UIViewController, inNavigationController navigationController: UINavigationController) {
        viewController.transitioningDelegate = self
        viewController.modalPresentationStyle = .custom
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SolarTransitionAnimator(withDuration: duration, forTransitionType: .presenting, originView: originView)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SolarTransitionAnimator(withDuration: duration, forTransitionType: .dismissing, originView: originView)
    }
    
}

extension SolarTransitionAnimator: SolarTransitionProtocol {
    
    func presentViewControllerAnimated(withFromView fromView: UIView, withToView toView: UIView, withContainerView containerView: UIView, andWithTransitionContext transitionContext: UIViewControllerContextTransitioning) {
        
        let circleView = UIView()
        
        let viewCenter = toView.center
        let viewSize = toView.frame.size
        
        let startingPoint = CGPoint(
            x: originView.frame.origin.x + originView.frame.size.width/2,
            y: originView.frame.origin.y + originView.frame.size.height/2
        )
        circleView.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
        circleView.layer.cornerRadius = circleView.frame.size.height / 2
        circleView.center = startingPoint
        circleView.backgroundColor = originView.backgroundColor
        circleView.alpha = 0
        circleView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        
        containerView.insertSubview(circleView, belowSubview: originView)
        
        UIView.animate(withDuration: duration, animations: {
            circleView.transform = CGAffineTransform.identity
            circleView.alpha = 1
        }, completion: { completed in
            toView.frame = fromView.frame
            containerView.addSubview(toView)
            toView.alpha = 0
            UIView.animate(withDuration: 0.3, animations: {
                toView.alpha = 1
            }, completion: { completed in
                circleView.removeFromSuperview()
                transitionContext.completeTransition(completed)
            })
        })
    }
    
    func frameForCircle(withViewCenter viewCenter:CGPoint, size viewSize:CGSize, startPoint:CGPoint) -> CGRect {
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offestVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offestVector, height: offestVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }


    func dismissViewControllerAnimated(withFromView fromView: UIView, withToView toView: UIView, withContainerView containerView: UIView, andWithTransitionContext transitionContext: UIViewControllerContextTransitioning) {
        
        let viewCenter = toView.center
        let viewSize = toView.frame.size
        
        fromView.frame = frameForCircle(
            withViewCenter: viewCenter,
            size: viewSize, startPoint: originView.center
        )
        fromView.layer.cornerRadius = fromView.frame.size.height / 2
        fromView.center = originView.center
        fromView.clipsToBounds = true
        
        UIView.animate(withDuration: duration, animations: { [weak self] in
            fromView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            fromView.alpha = 0.3
            if let originView = self?.originView {
                containerView.insertSubview(fromView, belowSubview: originView)
            }
            }, completion: { completed in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(completed)
        })
    }
    
}





