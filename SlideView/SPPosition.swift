//
//  SPPosition.swift
//  SlideView
//
//  Created by Konstantin Bondar on 29/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import UIKit

struct SPPosition {
    enum Horizontal {
        case left
        case right
        case x(CGFloat)
        
        func isLeft() -> Bool {
            switch self {
            case .left:
                return true
            default:
                return false
            }
        }
    }
    
    enum Vertical {
        case top
        case bottom
        case y(CGFloat)
        
        func isTop() -> Bool {
            switch self {
            case .top:
                return true
            default:
                return false
            }
        }
    }
    
    private(set) var vertical: Vertical = .y(100)
    private(set) var horizontal: Horizontal = .right
    
    var isVertical: Bool {
        if case .y = vertical {
            return false
        }
        return true
    }
    
    var isHorizontal: Bool {
        if case .x = horizontal {
            return false
        }
        return true
    }
    
    init(horizontal: Horizontal, vertical: Vertical) {
        self.horizontal = horizontal
        self.vertical = vertical
        if isHorizontal && isVertical {
            self.vertical = .y(0)
        }
        
    }
    
    
}
