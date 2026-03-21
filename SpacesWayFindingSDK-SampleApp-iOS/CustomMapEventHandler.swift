//
//  CustomMapEventsHandler.swift
//  SpacesWayfindingSample
//
//  Created by bhariswa on 28/06/25.
//
import UIKit
import SpacesWayFindingApp
import Foundation
import PointrKit

class CustomMapEventHandler: MapEventsHandler {
    
    /// This function is triggered when the map starts loading.
    
    override func mapDidStartLoading(_ map: MapViewController) {
        print("CustomMapEventHandler: mapDidStartLoading")
    }
    
    /// This function is triggered when the map finishes loading.
    
    override func mapDidEndLoading(_ map: MapViewController) {
        print("CustomMapEventHandler: mapDidEndLoading")
        addMarkers()
        addHeatMap()
     
     }
    
    override func mapDidReceiveTap(_ map: MapViewController, coordinate: CLLocationCoordinate2D) {
        print("CustomMapEventHandler: mapDidReceiveTap",coordinate)
    }
    
    func addHeatMap(){
        
        let geoJSON: [String: Any] = [
            "type": "FeatureCollection",
            "features": [
                    [
                        "type": "Feature",
                        "properties": [
                            "type": "work-space",
                            "fid": "2",
                            "name": "heatMap"
                        ],
                        "geometry": [
                             "type": "Polygon",
                              "coordinates": [
                                        [
                                             [
                                                -86.5970883661679,
                                                 36.168744183595436
                                              ],
                                              [
                                                -86.59718943953625,
                                                   36.168804768473834
                                              ],
                                              [
                                                -86.59721967735979,
                                                   36.168739546712104
                                              ],
                                              [
                                                  -86.5971120088282,
                                                   36.1688297194149
                                              ]
                                          ]
                                      ]
                         ]
                ]
            ]
        ]

        guard let geoJSONData = try? JSONSerialization.data(withJSONObject: geoJSON, options: []),
              let geoJSONString = String(data: geoJSONData, encoding: .utf8) else {
            print("Failed to stringify GeoJSON")
            return
        }
        
         mapWidget.addSource(id: "test-sourceId", source: ["type": "geojson", "data": geoJSONString])
         mapWidget.addLayer(layer: [
            "id": "source-layerId123",
            "type": "heatmap",
            "source": "test-sourceId",
            "source-layer": "maps-layer",
            "filter":["any", ["==", "type", "work-space"]],
            "paint": [
                "fill-color": "#FF0000",
            ],
            "layout": [
                "text": "{name}",
                "text-size": 12,
                "icon-image-name": "green_marker",
                ],
                            "minZoom":13,
                            "maxZoom":20
        ])
    }
    
    
    func addMarkers(){
        
        let markerLayer = mapWidget.addMarkerLayer(id: "test-markerLayerId")
        //markerLayer.setMarkers([  [-122.38749686323516, 37.77017375750313] , [-122.38711522299518, 37.770216437671664]])
        markerLayer.setMarkers([["coordinates": [-122.38711522299518, 37.770216437671664], "name": "Marker 1" ],["coordinates": [-122.38749686323516, 37.77017375750313], "name": "Marker 2" ]])
    
        //markerLayer.setIcon(url: "https://wf.ciscospaces.io/wf-api/static/assets/icon.png", imageOptions: [ "pixelRatio": 2, "sdf": true ])

        markerLayer.setPaint(["text-color": "#000000"])
        markerLayer.setLayout(["icon-text-fit": "none"])
    }
     
}
