# Ricktionary

A Rick and Morty character encyclopedia iOS app built with SwiftUI that demonstrates clean architecture principles and modern iOS development practices.

## Architecture & Technical Details

### MVVM Architecture
The app follows the Model-View-ViewModel (MVVM) architectural pattern:
- **Views**: SwiftUI views that handle the UI presentation
- **ViewModels**: Handle business logic and state management
- **Models**: Data models and entities

### Modularization
The project is split into multiple modules for better separation of concerns:

- **App Layer**
  - Main app target
  - UI Implementation
  - DI Container

- **Domain Layer** 
  - Entities
  - Use Cases
  - Repository Protocols

- **Data Layer**
  - Repository Implementations
  - Network Services
  - Data Models

### Dependencies

#### Kingfisher
Image loading and caching library integrated via Swift Package Manager (SPM).
```swift
dependencies: [
    .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.1.0")
]
```

Used for efficient loading and caching of character images from the Rick & Morty API.

### Key Features
- Character list with infinite scrolling
- Character detail view
- Search functionality
- Image caching
- MVVM with a small Clean architecture implementation
- Modular design

### Requirements
- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

### Installation
1. Clone the repository
2. Open `Ricktionary.xcodeproj`
3. Wait for SPM to resolve dependencies
4. Build and run

### Project Structure
```
Ricktionary/
├── App/
│   └── RicktionaryApp.swift
├── Presentation/
│   ├── CharacterList/
│   └── CharacterDetail/
├── Domain/
│   ├── Entities/
│   ├── UseCases/
│   └── RepositoryProtocol/
└── Data/
    ├── Repository/
    └── Services/
```

## License
This project is available under the MIT license.
