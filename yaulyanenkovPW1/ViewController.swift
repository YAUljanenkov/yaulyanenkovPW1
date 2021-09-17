//
//  ViewController.swift
//  yaulyanenkovPW1
//
//  Created by Ярослав Ульяненков on 10.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var views: [UIView]!
    
    func animateViews(button: UIButton?) {
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        button?.isEnabled = false;
        UIView.animate(withDuration: 0.3, animations: {
            for view in self.views {
                view.layer.cornerRadius = 10
                view.backgroundColor = set.popFirst();
            }
        }) { completion in
            button?.isEnabled = true;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for view in views {
            view.layer.cornerRadius = 10;
        }
        animateViews(button: nil);
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        animateViews(button: sender as? UIButton);
    }
    
}

