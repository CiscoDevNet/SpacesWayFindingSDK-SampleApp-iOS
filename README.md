# SpacesWayFindingSDK-SampleApp-iOS

A sample iOS application demonstrating the integration and usage of the Spaces WayFinding SDK for indoor navigation and mapping. This project showcases how to use the SDK in a real-world scenario, including map display, building selection, and pathfinding features.

## Features
- Indoor map display using Mapbox
- Building and floor selection
- Pathfinding and navigation
- Custom event handling for map and navigation events
- Example integration of SpacesWayFindingSDK and SpacesWayFindingApp frameworks

## Requirements
- Xcode 13 or later
- iOS 16.0 or later
- Swift 5.0 or later
- Mapbox SDK (included as xcframework)
- SpacesWayFindingSDK and SpacesWayFindingApp (included as xcframeworks)

## Getting Started

### 1. Clone the Repository
```sh
git clone https://github.com/CiscoDevNet/SpacesWayFindingSDK-SampleApp-iOS.git
cd SpacesWayFindingSDK-SampleApp-iOS
```

### 2. Open the Project
Open `SpacesWayFindingSDK-SampleApp-iOS.xcodeproj` in Xcode.

### 3. Build and Run
- Select a simulator or a physical device.
- Build and run the app.

### 4. SDK Integration
The required frameworks (`Mapbox`, `SpacesWayFindingSDK`, `SpacesWayFindingApp`) are included in the `Frameworks/` directory as `.xcframework` bundles. Ensure they are linked in the Xcode project settings.

## Project Structure
- `AppDelegate.swift`, `SceneDelegate.swift`: App lifecycle management
- `BuildingsViewController.swift`: Building selection UI
- `WidgetViewController.swift`: Main map and navigation UI
- `WayfindingHelper.swift`: Helper for SDK integration
- `Custom*Handler.swift`: Custom event handlers for map and navigation events
- `Frameworks/`: Contains required SDKs as xcframeworks
- `Assets.xcassets/`: App icons and color assets
- `Base.lproj/`: Storyboards for UI

## Documentation
- See `WF-SDK-V1.2-Document.pdf` for detailed SDK documentation and API reference.

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License
See [LICENSE](LICENSE) for license information.

## Security
See [SECURITY.md](SECURITY.md) for security policies.

## Code of Conduct
See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for community standards.

## Support
For questions or support, please refer to the documentation or open an issue in this repository.
