//
//  SPStateController.swift
//  SlideView
//
//  Created by Konstantin Bondar on 29/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import Foundation

typealias Action = () -> ()

public protocol SPActionDelegate: class {
    func appear()
    
    func show()
    
    func startEdit()
    
    func stopEdit()
    
    func hide()
    
    func dissapear()
}

public class SPStateController {
    enum State: Int, Comparable {
        static func < (lhs: SPStateController.State, rhs: SPStateController.State) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        case outOfScreen
        case peak
        case showed
        case editing
    }
    
    private weak var actionDelegate: SPActionDelegate?
    
    init(actionDelegate: SPActionDelegate?) {
        self.actionDelegate = actionDelegate
    }
    
    private(set) var state: State = .peak {
        didSet {
            guard state != oldValue else {
                return
            }
            
            let action = state.rawValue > oldValue.rawValue ? forwardRoute[state] : backwardRoute[state]
            action??()
        }
    }
    
    private lazy var forwardRoute: [State: Action?] = [.outOfScreen: nil,
                                                      .peak: self.actionDelegate?.appear,
                                                      .showed: self.actionDelegate?.show,
                                                      .editing: self.actionDelegate?.startEdit]
    private lazy var backwardRoute: [State: Action?] = [.outOfScreen: self.actionDelegate?.dissapear,
                                                        .peak: self.actionDelegate?.hide,
                                                        .showed: self.actionDelegate?.stopEdit,
                                                        .editing: nil]
    
    func nextState() {
        state = State(rawValue: state.rawValue + 1) ?? state
    }
    
    func prevState() {
        state = State(rawValue: state.rawValue - 1) ?? state
    }
    
    func userTapped() {
        if state > .peak {
            prevState()
        } else {
            nextState()
        }
    }
}
