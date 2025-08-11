//
//  ViewController.swift
//  SpacesWayfindingSample
//
//  Created by Cisco Spaces on 07/02/2025.
//

import UIKit
import SpacesWayFindingApp

class LoadingViewController: UIViewController {

    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    @IBOutlet weak var label: UILabel!
    
    let wayfindingHelper = WayfindingHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBuildings()
        
    }
    
    func loadBuildings() {
        wayfindingHelper.spacesWayFinding.getAllBuildings{ buildings, error in
            OperationQueue.main.addOperation {
                if let buildingsParams = buildings {
                    self.presentBuildingsList(buildingsParams: buildingsParams)
                } else {
                    self.loadingSpinner.stopAnimating()
                    self.label.text = "Error loading buildings"
                    print(error?.description ?? "No error description")
                }
            }
        }
    }
    
    func presentBuildingsList(buildingsParams: [SpacesBuilding]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let buildingsViewController = storyboard.instantiateViewController(withIdentifier: "BuildingsViewController") as! BuildingsViewController
        buildingsViewController.buildings = buildingsParams

        let navigationController = UINavigationController(rootViewController: buildingsViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        present(navigationController, animated: true)
    }
}

