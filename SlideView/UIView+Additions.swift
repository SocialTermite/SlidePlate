//
//  UIView+Additions.swift
//  SlideView
//
//  Created by Konstantin Bondar on 29/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    func addSubview(_ view: UIView, maker: (ConstraintMaker) -> Void) {
        addSubview(view)
        view.snp.makeConstraints(maker)
    }
}
