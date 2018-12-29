//
//  ViewController.swift
//  SlideView
//
//  Created by Konstantin Bondar on 15/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
    }

    var plate: SlidePlate!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let contView = UIView()
        contView.backgroundColor = .green
        let label = UILabel()
        label.text = "hello fasdkflkadjhasdfsldjfhal h;lajhf"
        label.numberOfLines = 0
        contView.addSubview(label) { (maker) in
            maker.edges.equalToSuperview()
        }
        contView.snp.makeConstraints { (maker) in
            maker.height.equalTo(50)
        }
        
        plate = SlidePlate.install(contView, into: view, at: SPPosition(horizontal: .left, vertical: .y(150)))
    }
    @IBAction func some(_ sender: Any) {
        if plate.state == .default {
            plate.show()
        } else {
            plate.hide()
        }
    }
}

