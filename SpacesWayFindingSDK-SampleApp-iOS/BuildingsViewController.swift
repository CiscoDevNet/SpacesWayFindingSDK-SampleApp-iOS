//
//  BuildingsViewController.swift
//  SpacesWayfindingSample
//
//  Created by Cisco Spaces on 07/02/2025.
//

import UIKit
import SpacesWayFindingApp

class BuildingsViewController: UITableViewController {
    
    var buildings: [SpacesBuilding] = []
    var wayfindingHelper = WayfindingHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Buildings"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell", for: indexPath)
        cell.textLabel?.text = buildings[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let building = buildings[indexPath.row]
        let params = SpacesWayFindingParams(building: building)
        presentWidget(buildingParams: params)
    }
}

extension BuildingsViewController {
    
    func presentWidget(buildingParams: SpacesWayFindingParams) {
        
        let widget = WidgetViewController(buildingParams: buildingParams)
        widget.modalPresentationStyle = .fullScreen
        navigationController?.present(widget, animated: true)
    }
}
