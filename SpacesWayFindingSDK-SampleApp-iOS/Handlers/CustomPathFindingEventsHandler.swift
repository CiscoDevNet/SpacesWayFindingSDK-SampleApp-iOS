//
//  sss.swift
//  SpacesWayfindingSample
//
//  Created by bhariswa on 29/06/25.
//
import SpacesWayFindingApp

class CustomPathFindingEventsHandler: PathFindingEventsHandler {
    
    /// This function is called when the close button is tapped after way finding has finished
    
    override func wayfindingDidTapClose(_ destination: Feature) {
        
        print("CustomPathFindingEventsHandler: wayfindingDidTapClose")

    }
    
    /// This function is called when the cancel button is tapped while way finding is active.
    
    override func wayfindingDidTapCancel(_ destination: Feature) {
        
        print("CustomPathFindingEventsHandler: wayfindingDidTapCancel")

        
    }

    
}
