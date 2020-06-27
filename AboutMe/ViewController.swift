//
//  ViewController.swift
//  AboutMe
//
//  Created by CompSci 4220 Student on 6/19/20.
//  Copyright © 2020 CompSci 4220 JanuaryJohnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let nameLabel = UILabel()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var textLabels: [UILabel]!
    @IBOutlet var modeSwitch: UISwitch!
    
    //toggles dark and light mode
    @IBAction func switchMode(_ sender: Any) {
        imageFlip(imageView: imageView)
        if (modeSwitch.isOn){
            modeSwitch.setOn(true, animated: true)
            backgroundImageView.image = nil
            view.backgroundColor = UIColor.white
            backgroundImageView.image = UIImage(named: "background-skydarkstar")
            modeSwitch.thumbTintColor = UIColor.lightGray
            UIView.animate(withDuration: 0.5){
                self.backgroundImageView.alpha = 0
                self.textLabels.forEach
                {
                    el in
                    el.textColor = UIColor.white
                }
                self.nameLabel.textColor = UIColor.white
            }
            UIView.animate(withDuration: 0.5)
            {
                self.backgroundImageView.alpha = 1
            }
        }
        else
        {
            modeSwitch.setOn(false, animated: true)
            backgroundImageView.image = nil
            view.backgroundColor = UIColor.black
            backgroundImageView.image = UIImage(named: "background-mountainswhite")
             modeSwitch.thumbTintColor = UIColor.white
            UIView.animate(withDuration: 0.5){
                self.backgroundImageView.alpha = 0
                self.textLabels.forEach
                {
                    el in
                    el.textColor = UIColor.black
                }
                self.nameLabel.textColor = UIColor.black
            }
            UIView.animate(withDuration: 0.5)
            {
                self.backgroundImageView.alpha = 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackground(imageName: "background-mountainswhite")
        addImage(imageName: "melight")
        addNameLabel(profileName: "January Johnson")
        modeSwitch.setOn(false, animated: true)
    }

    func setBackground(imageName img: String) {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: img)
        view.sendSubviewToBack(self.backgroundImageView)
    }
    
    func addImage(imageName img: String) {
        imageView.frame = CGRect(x: 60, y: 80, width: 300, height: 300)
        
        imageView.contentMode = . scaleAspectFill
        if let newImage = UIImage(named: img) {
            imageView.image = newImage
        }
        view.addSubview(imageView)
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
    }
    
    func addNameLabel(profileName: String) {
        nameLabel.frame = CGRect(x: 82, y:410, width: 250, height: 40)
        nameLabel.font = UIFont.systemFont(ofSize: 30)
        nameLabel.text = profileName
        nameLabel.textAlignment = NSTextAlignment.center
        view.addSubview(nameLabel)
    }
    
    func imageFlip(imageView view: UIImageView)
    {
        UIImageView.transition(with: view, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
}



