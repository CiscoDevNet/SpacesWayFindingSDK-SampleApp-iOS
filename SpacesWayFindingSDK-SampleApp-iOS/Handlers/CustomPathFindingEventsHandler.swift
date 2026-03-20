//
//  sss.swift
//  SpacesWayfindingSample
//
//  Created by bhariswa on 29/06/25.
//
import SpacesWayFindingApp

class CustomPathFindingEventsHandler: PathFindingEventsHandler {
    
    /// This function is called when the close button is tapped after path finding has finished
    
    override func wayfindingDidTapClose(_ destination: Feature) {
        
        print("CustomPathFindingEventsHandler: pathFindingDidTapClose")
        
       // mapWidget.pathFindingEventsHandler?.mapWidget.navigationController?.visibleViewController.

    }
    
    /// This function is called when the cancel button is tapped while path finding is active.
    
    override func wayfindingDidTapCancel(_ destination: Feature) {
        
        print("CustomPathFindingEventsHandler: pathFindingDidTapCancel")
      //  pathFinding.dismiss(animated: true)

        
    }

    
}
