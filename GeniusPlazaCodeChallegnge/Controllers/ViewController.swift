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

    var mainTableView:UITableView!
    var tableviewData:[appleData] = []
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        rightBarButtonSetup()
        NetworkingService.requestData(index: index) { (data) in
            self.tableviewData = data
            self.mainTableView.reloadData()
            self.setTitle()
            self.index += 1
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        if UIDevice.current.orientation.isLandscape {
            UIView.animate(withDuration: 1) {
                self.mainTableView.frame.size = CGSize(width: size.width , height: size.height)
                self.mainTableView.reloadData()
                self.view.setNeedsLayout()
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.mainTableView.frame = CGRect(x: 20, y: 0, width: size.width - 40, height: size.height)
                self.mainTableView.reloadData()
                self.view.setNeedsLayout()
            }
        }
    }

    func rightBarButtonSetup() {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        button.setImage(UIImage(imageLiteralResourceName: "Arrow"), for: .normal)
        button.addTarget(self, action: #selector(incrementMediaType), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }

    func setupTableView() {
        mainTableView = UITableView()
        mainTableView.autoresizesSubviews = true
        mainTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: self.view.frame.height)
        mainTableView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(itunesTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(mainTableView)
    }

    func setTitle() {

        switch self.index {
        case 0:
            self.title = "Apple Music"
        case 1:
            self.title = "Itunes Music"
        case 2:
            self.title = "iOS Apps"
        case 3:
            self.title = "Mac Apps"
        case 4:
            self.title = "Audiobooks"
        case 5:
            self.title = "Books"
        case 6:
            self.title = "TV Shows"
        default:
            self.title = ""
        }
    }

    @objc func incrementMediaType() {
        if index == 7 {
            index = 0
        }

        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                self.mainTableView.frame.origin = CGPoint(x: -self.mainTableView.frame.width - 50, y: 0)
                self.mainTableView.layer.opacity = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.1, animations: {
                self.mainTableView.frame.origin = CGPoint(x: self.mainTableView.frame.width + 50, y: 0)
                NetworkingService.requestData(index: self.index) { (data) in
                    self.tableviewData = data
                    self.mainTableView.reloadData()
                    self.setTitle()
                    self.index += 1
                }
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2, animations: {
                self.mainTableView.layer.opacity = 1
                self.mainTableView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
            })
            self.mainTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)

        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "Cell") as! itunesTableViewCell
        let data = tableviewData[indexPath.row]
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

            if UIApplication.shared.statusBarOrientation.isLandscape {
                UIView.animate(withDuration:1) {
                    newCell.imageCover.frame.size = CGSize(width: 100, height: 100)
                    newCell.containerView.frame.size = CGSize(width: self.mainTableView.frame.width, height: newCell.frame.height - 5)
                    newCell.titleLabel.frame.origin = CGPoint(x: newCell.imageCover.frame.maxX + 10, y: newCell.imageCover.frame.minY + 5)
                    newCell.titleLabel.frame.size = CGSize(width: newCell.containerView.frame.width - newCell.imageCover.frame.width - 20, height: 20)
                    newCell.descriptionLabel.frame.size = CGSize(width: newCell.containerView.frame.width - newCell.imageCover.frame.width - 20, height: 20)
                    newCell.descriptionLabel.frame.origin = CGPoint(x: newCell.imageCover.frame.maxX + 10, y: newCell.imageCover.frame.maxY - newCell.descriptionLabel.frame.height - 5)
                }
            } else {
                UIView.animate(withDuration: 1) {
                    newCell.imageCover.frame.size = CGSize(width: 85, height: 85)
                    newCell.containerView.frame.size = CGSize(width: self.mainTableView.frame.width - 20, height: newCell.frame.height - 5)
                    newCell.titleLabel.frame.origin = CGPoint(x: newCell.imageCover.frame.maxX + 10, y: newCell.imageCover.frame.minY + 5)
                    newCell.titleLabel.frame.size = CGSize(width: newCell.containerView.frame.width - newCell.imageCover.frame.width - 20, height: 20)
                    newCell.descriptionLabel.frame.size = CGSize(width: newCell.containerView.frame.width - newCell.imageCover.frame.width - 20, height: 20)
                    newCell.descriptionLabel.frame.origin = CGPoint(x: newCell.imageCover.frame.maxX + 10, y: newCell.imageCover.frame.maxY - newCell.descriptionLabel.frame.height - 5)
                }
            }
        }
    }
}
