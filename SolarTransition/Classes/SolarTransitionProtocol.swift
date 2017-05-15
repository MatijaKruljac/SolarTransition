//
//  SolarTransitionProtocol.swift
//  Pods
//
//  Created by Matija Kruljac on 1/29/17.
//
//

import Foundation

protocol SolarTransitionProtocol {
    func presentViewControllerAnimated(withFromView fromView: UIView, withToView toView: UIView, withContainerView containerView: UIView, andWithTransitionContext transitionContext: UIViewControllerContextTransitioning)
    func dismissViewControllerAnimated(withFromView fromView: UIView, withToView toView: UIView, withContainerView containerView: UIView, andWithTransitionContext transitionContext: UIViewControllerContextTransitioning)
}

extension SolarTransitionProtocol {
    func presentViewControllerAnimated(withFromView fromView: UIView, withToView toView: UIView, withContainerView containerView: UIView, andWithTransitionContext transitionContext: UIViewControllerContextTransitioning) {
        print("default implementation")
    }
    
    func dismissViewControllerAnimated(withFromView fromView: UIView, withToView toView: UIView, withContainerView containerView: UIView, andWithTransitionContext transitionContext: UIViewControllerContextTransitioning) {
        print("default implementation")
    }
}
