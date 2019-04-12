//
//  ViewController.swift
//  GeniusPlazaCodeChallegnge
//
//  Created by Kadeem Palacios on 4/11/19.
//  Copyright © 2019 Kadeem Palacios. All rights reserved.
//

import UIKit
import AlamofireImage
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var itunesTableView:UITableView!
    var itunesInfo:[itunesData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        NetworkingService.requestData { (data) in
            self.itunesInfo = data
            self.title = "Apple Music"
            self.itunesTableView.reloadData()
        }

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        if UIDevice.current.orientation.isLandscape {
            UIView.animate(withDuration: 1) {

                self.itunesTableView.frame = CGRect(x: 0, y: 0, width: size.width , height: size.height)
                self.itunesTableView.reloadData()
                self.itunesTableView.setNeedsLayout()
                self.view.setNeedsLayout()
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.itunesTableView.frame = CGRect(x: 20, y: 0, width: size.width - 40, height: size.height)

                self.itunesTableView.reloadData()
                self.view.setNeedsLayout()
            }
        }
    }
    func setupTableView() {
        itunesTableView = UITableView()
        itunesTableView.autoresizesSubviews = true
        itunesTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: self.view.frame.height)
        itunesTableView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        itunesTableView.delegate = self
        itunesTableView.dataSource = self
        itunesTableView.register(itunesTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(itunesTableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itunesInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itunesTableView.dequeueReusableCell(withIdentifier: "Cell") as! itunesTableViewCell
        let data = itunesInfo[indexPath.row]
        cell.titleLabel.text = data.title
        cell.descriptionLabel.text = data.artist
        DispatchQueue.main.async {
            UIView.animate(withDuration: 2, animations: {

                cell.imageCover.af_setImage(withURL: URL(string: data.image)!)
            })
        }


        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let newCell = cell as? itunesTableViewCell {
            //                newCell.layer.opacity = 0


            if UIApplication.shared.statusBarOrientation.isLandscape {
                UIView.animate(withDuration: 3.2) {
                    newCell.imageCover.frame.size = CGSize(width: 100, height: 100)
                    newCell.containerView.frame.size = CGSize(width: self.itunesTableView.frame.width, height: newCell.frame.height - 5)
                    newCell.imageCover.center = CGPoint(x: newCell.imageCover.frame.width/2 + 10, y: newCell.containerView.bounds.midY)
                    newCell.titleLabel.frame.origin = CGPoint(x: newCell.imageCover.frame.maxX + 10, y: newCell.imageCover.frame.minY + 5)
                    newCell.descriptionLabel.frame.origin = CGPoint(x: newCell.imageCover.frame.maxX + 10, y: newCell.imageCover.frame.maxY - newCell.descriptionLabel.frame.height - 5)
                }
            } else {
                UIView.animate(withDuration: 0.5) {
                    newCell.imageCover.frame.size = CGSize(width: 70, height: 70)
                    newCell.containerView.frame.size = CGSize(width: self.itunesTableView.frame.width - 20, height: newCell.frame.height - 5)
                    newCell.titleLabel.frame.origin = CGPoint(x: newCell.imageCover.frame.maxX + 10, y: newCell.imageCover.frame.minY + 5)
                    newCell.descriptionLabel.frame.origin = CGPoint(x: newCell.imageCover.frame.maxX + 10, y: newCell.imageCover.frame.maxY - newCell.descriptionLabel.frame.height - 5)
                }
            }
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1, animations: {
                    //                        newCell.layer.opacity = 1
                })
            }
        }
    }





}

