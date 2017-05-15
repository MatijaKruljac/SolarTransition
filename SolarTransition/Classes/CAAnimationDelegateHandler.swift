//
//  CAAnimationDelegateHandler.swift
//  Pods
//
//  Created by Matija Kruljac on 1/31/17.
//
//

import Foundation

public class CAAnimationDelegateHandler: NSObject, CAAnimationDelegate {
    
    let startBlock: (()->Void)?
    let completionBlock: (()->Void)?
    
    init(startBlock: (()->Void)? = nil, completionBlock: (()->Void)? = nil) {
        self.startBlock = startBlock
        self.completionBlock = completionBlock
        super.init()
    }
    
    public func animationDidStart(_ anim: CAAnimation) {
        guard let startBlock = startBlock else { return }
        startBlock()
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let completionBlock = completionBlock else { return }
        completionBlock()
    }
}
