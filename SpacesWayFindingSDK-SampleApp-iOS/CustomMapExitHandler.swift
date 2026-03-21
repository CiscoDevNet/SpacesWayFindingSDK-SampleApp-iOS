//
//  MapExitHandler.swift
//  SpacesWayfindingSample
//
//  Created by bhariswa on 29/06/25.
//
import SpacesWayFindingApp

class CustomMapExitHandler: ExitButtonEventsHandler {
    
    /// This function is triggered when the exit button is tapped.
    
    override func exitButtonDidTap(_ exitbutton: MapWidgetExitButton) {
       // super.exitButtonDidTap(exitbutton)
        print("CustomMapExitHandler: exitButtonDidTap")
    }
    
}
