//
//  ViewController.swift
//  Parking Finder
//
//  Created by Server on 2/7/21.
//

import UIKit

class homeViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

}
class accountViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func didTapCreateProfileButton()
    {
        guard let vc = storyboard?.instantiateViewController(identifier: "createProfile_vc") as? createProfileViewController
        else
        {
            return
        }
        present(vc, animated: true)
    }
    @IBAction func didTaploginProfileButton()
    {
        guard let vc = storyboard?.instantiateViewController(identifier: "loginProfile_vc") as? loginViewController
        else
        {
            return
        }
        present(vc, animated: true)
    }
}
class finderViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

}
