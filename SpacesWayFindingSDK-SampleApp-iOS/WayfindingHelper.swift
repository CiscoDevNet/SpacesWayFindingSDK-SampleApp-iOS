//
//  WayfindingHelper.swift
//  SpacesWayfindingSample
//
//  Created by Cisco Spaces on 07/02/2025.
//

import UIKit
import SpacesWayFindingApp

class WayfindingHelper: NSObject {
    
    let spacesWayFinding = SpacesWayFinding(apiKey:"0Ws3-Rh2usbM4-39OJYww7mQ92a4Nb2eVqO4GXOATT8",region: SpacesWayFindingRegion.IO)

    private var completion: ((MapWidgetViewController?, Error?) -> Void)?
    
    func getWidget(buildingParams: SpacesWayFindingParams, completion: ((MapWidgetViewController?, Error?) -> Void)? = nil) {
        
        self.completion = completion
        
        spacesWayFinding.selectBuilding(params: buildingParams) { [weak self] (state) in
            switch state {
            case .running:
                print("Wayfinding is running")
                self?.handleCompletion(error: nil)
                break;
            case .failedNoInternetConnection:
                print("Failed: No internet")
            case .failedValidation:
                print("Validation failed")
            case .off:
                print("off")
               // removeMapWidget(mapWidget: MapWidgetTheme)
            default:
                print("Current state: \(state)")
            }
          
        }
      
    }
}

extension WayfindingHelper {
    
    func handleCompletion(error: Error?) {
        OperationQueue.main.addOperation { [weak self] in
            if let error = error {
                self?.completion?(nil, error)
                return
            }
            
            
            let config = MapWidgetConfiguration.defaultConfiguration()
             config.isJoystickEnabled = true
             config.isOnboardingEnabled = true
            config.animationType=MapAnimationType.flyOver
            let theme = MapWidgetTheme(accentColor: "000000", backgroundColor:  "000000", foregroundColor: "000000", successColor: "FFFFFF", alertColor: "FFFFFF", dangerColor: "FFFFFF", infoColor: "FFFFFF")

            
             let mapWidget = MapWidgetViewController(configuration: config)
              mapWidget.mapEventsHandler = CustomMapEventHandler(mapWidget: mapWidget)
             mapWidget.pathFindingEventsHandler = CustomPathFindingEventsHandler(mapWidget: mapWidget)
             mapWidget.mapExitHandler = CustomMapExitHandler(mapWidget: mapWidget)
            
            
            self?.completion?(mapWidget, nil)
            self?.completion = nil
        }
    }
}
