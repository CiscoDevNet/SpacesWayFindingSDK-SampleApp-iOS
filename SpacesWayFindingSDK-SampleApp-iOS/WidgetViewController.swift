//
//  WidgetViewController.swift
//  SpacesWayfindingSample
//
//  Created by Cisco Spaces on 07/02/2025.
//

import UIKit
import SpacesWayFindingApp

class WidgetViewController: UIViewController {
    
    let wayfindingHelper = WayfindingHelper()
    
    let buildingParams: SpacesWayFindingParams
    
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    init(buildingParams: SpacesWayFindingParams) {
        self.buildingParams = buildingParams
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
                        
        
        wayfindingHelper.getWidget(buildingParams: buildingParams) {     [weak self] widget, error in
            guard let mapWidget = widget else {
                self?.handleError(error)
                print("getWidget: error")
                print(error)
                return
            }
            
           
            self?.spinner.stopAnimating()
            self?.presentMapWidget(mapWidget: mapWidget)
            print(self?.wayfindingHelper.spacesWayFinding.getPoIs())
            if let poi = self?.wayfindingHelper.spacesWayFinding.getPoIs().first {
               // print(poi) // Will print your custom content
            }
            print(self?.wayfindingHelper.spacesWayFinding.getFloors())
            print(self?.wayfindingHelper.spacesWayFinding.getFloor(level: 1))
            //print(self?.wayfindingHelper.spacesWayFinding.getPoIById(id: "44dcc43e-b682-4fff-b8af-999b35f81997"))
            //print(self?.wayfindingHelper.spacesWayFinding.getPoIByExternalId(externalId: "1~102A"))

            if let floor = self?.wayfindingHelper.spacesWayFinding.getFloor(level: 3) {
                print(self?.wayfindingHelper.spacesWayFinding.getPoIs(floorId: floor.extraData[ "levelExternalIdentifier"] as? String ?? "fasfd"))

                mapWidget.showFloor(floor: floor){error in
                    print("32412erfdserror")
                    print(error)
                }
            }
            
            var poi=self?.wayfindingHelper.spacesWayFinding.getPoIById(id: "44dcc43e-b682-4fff-b8af-999b35f81997")

           
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                if let poi = self?.wayfindingHelper.spacesWayFinding.getPoIByExternalId(externalId: "44dcc43e-b682-4fff-b8af-999b35f81997") {
                    print("POI :")
                    print(poi)
                    mapWidget.showPoI(poi: poi) { error in
                        print("error: POI print(error)")
                        print(error)
                    }
                    
                } else {
                    // Handle the case where the PoI was not found
                    print("PoI not found for the given ID.")
                }
            }
            
           
            
        }
        
        

       /** mapWidget.showPoI(poi: wayfindingHelper.spacesWayFinding.getPoIById(id: "44dcc43e-b682-4fff-b8af-999b35f81997")!){error in
            print(error)
        }*/
   }
        
    
}

extension WidgetViewController {
    
    func presentMapWidget(mapWidget: MapWidgetViewController) {
        addChild(mapWidget)
        mapWidget.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapWidget.view)
        mapWidget.didMove(toParent: self)
        NSLayoutConstraint.activate([
            mapWidget.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapWidget.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapWidget.view.topAnchor.constraint(equalTo: view.topAnchor),
            mapWidget.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func removeMapWidget(mapWidget: MapWidgetViewController) {
        mapWidget.willMove(toParent: nil)
        mapWidget.view.removeFromSuperview()
        mapWidget.removeFromParent()
    }
}

extension WidgetViewController {
    
    func configureViews() {
        view.backgroundColor = .darkGray
        view.addSubview(spinner)
        spinner.startAnimating()
        spinner.ptr_addCenterVerticalConstraint(withConstant: 0)
        spinner.ptr_addCenterHorizontalConstraint(withConstant: 0)
    }
    
    func handleError(_ error: Error?) {
        spinner.stopAnimating()
        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
