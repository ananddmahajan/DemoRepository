//
//  SecondViewController.swift
//  DemoApp
//
//  Created by Pepsico_1 on 1/30/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let reuseIdentifier = "TableCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func selectNetworkAction(_ sender: Any) {
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        } else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
        if sender.state == .ended {
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        } else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    
    @objc func handleDoubleTap() {
        print("Double tap")
    }
    
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SecondVCTableViewCell
        cell.selectionStyle = .none
        //Longpress
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPress.minimumPressDuration = 1.0
        longPress.delaysTouchesBegan = true
        cell.addGestureRecognizer(longPress)
        //        longPress.cancelsTouchesInView = true
        
        // Double Tap
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        cell.addGestureRecognizer(doubleTapGesture)
        
        cell.titleLabel.text = "Title \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        
        let cell = tableView.cellForRow(at: indexPath!) as? SecondVCTableViewCell
        cell?.switchOnOff.setOn(!((cell?.switchOnOff.isOn)!), animated: true)
//        tableView.reloadRows(at: [indexPath!], with: .none)
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.cellForRow(at: indexPath) as? SecondVCTableViewCell
        if cell != nil && (cell?.switchOnOff!.isOn)! {
            return 80
        } else {
            return 40
        }
        //        return 40
    }
}

