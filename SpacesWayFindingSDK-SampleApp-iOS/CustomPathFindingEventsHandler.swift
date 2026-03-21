//
//  sss.swift
//  SpacesWayfindingSample
//
//  Created by bhariswa on 29/06/25.
//
import SpacesWayFindingApp

class CustomPathFindingEventsHandler: PathFindingEventsHandler {
    
    /// This function is called when the close button is tapped after path finding has finished
    
    override func pathFindingDidTapClose(_ pathFinding: PathFindingViewController) {
        
        print("CustomPathFindingEventsHandler: pathFindingDidTapClose")
        
       // mapWidget.pathFindingEventsHandler?.mapWidget.navigationController?.visibleViewController.

    }
    
    /// This function is called when the cancel button is tapped while path finding is active.
    
    override func pathFindingDidTapCancel(_ pathFinding: PathFindingViewController) {
        
        print("CustomPathFindingEventsHandler: pathFindingDidTapCancel")
      //  pathFinding.dismiss(animated: true)

        
    }
    
    
    /// Function that handles the close action while path finding is still in progress.
    
    override func handleDidTapCloseWhileInProgress (_ pathFinding: PathFindingViewController) {
        //pathFinding.d
        print("CustomPathFindingEventsHandler: handleDidTapCloseWhileInProgress")
       // mapWidget.pathFindingEventsHandler?.self.handleDidTapCloseWhileInProgress(pathFinding)

     //   pathFinding.dismiss(animated: true)

    }
    
    /// Function that handles the close action when arrived.
    
    override func handleDidTapCloseWhenArrived() {
                
        //super.handleDidTapCloseWhenArrived()
        print("CustomPathFindingEventsHandler: handleDidTapCloseWhenArrived")
       // mapdismiss(animated: true)
        
    }
    
}
