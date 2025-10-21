# Appetizers iOS App 🍟

A modern SwiftUI-based iOS application that allows users to browse, order, and manage appetizers with a complete user account system. The app features a clean, intuitive interface with real-time data fetching from a Node.js backend server.

## 📱 Features

### Core Functionality
- **Browse Appetizers**: View a comprehensive list of available appetizers with images, descriptions, and nutritional information
- **Order Management**: Add items to cart, view order summary, and manage quantities
- **User Account**: Create and manage user profiles with personal information and preferences
- **Real-time Data**: Fetch appetizer data from a live backend API
- **Persistent Storage**: Save user preferences and account information locally

### User Interface
- **Tab-based Navigation**: Easy switching between Appetizers, Account, and Order views
- **Detail Views**: Comprehensive appetizer information with nutritional data
- **Loading States**: Visual feedback during data fetching
- **Empty States**: User-friendly messages when no data is available
- **Form Validation**: Email validation and required field checking
- **Responsive Design**: Optimized for various iOS device sizes

## 🏗️ Architecture

### Frontend (iOS App)
- **Framework**: SwiftUI with iOS 26 deployment target
- **Architecture Pattern**: MVVM (Model-View-ViewModel)
- **State Management**: Combine framework with `@Published` properties
- **Data Persistence**: UserDefaults with `@AppStorage`
- **Networking**: URLSession with async/await
- **Navigation**: NavigationStack and TabView

### Backend (Node.js Server)
- **Runtime**: Node.js with Express.js framework
- **Data**: In-memory mock data (14 appetizer items)
- **API**: RESTful endpoints with JSON responses
- **CORS**: Enabled for cross-origin requests
- **Static Files**: Image serving from public directory

## 📁 Project Structure

```
Appetizers/
├── AppetizersApp.swift              # Main app entry point
├── Models/
│   ├── Appetizer.swift              # Appetizer data model
│   ├── Order.swift                  # Order management class
│   └── User.swift                   # User profile model
├── Screens/
│   ├── AppetizerTabView.swift       # Main tab container
│   ├── AppetizerListView/
│   │   ├── AppetizerListView.swift  # Appetizer list screen
│   │   ├── AppetizerListViewModel.swift # List view model
│   │   └── AppetizerDetailView.swift # Detail modal view
│   ├── AccountView/
│   │   ├── AccountView.swift        # User account screen
│   │   └── AccountViewModel.swift   # Account view model
│   └── OrderView/
│       └── OrderView.swift          # Order management screen
├── Views/
│   ├── Buttons/
│   │   ├── APButton.swift           # Custom button component
│   │   └── XDismissButton.swift     # Dismiss button component
│   ├── Cells/
│   │   └── AppetizerListCell.swift  # List item component
│   ├── Empty States/
│   │   └── EmptyState.swift         # Empty state view
│   ├── CustomModifiers.swift        # View modifiers
│   ├── LoadingView.swift            # Loading indicator
│   └── RemoteImage.swift            # Async image loader
├── Utilities/
│   ├── Alerts/
│   │   ├── Alert.swift              # Alert definitions
│   │   └── APError.swift            # Error types
│   ├── Extensions/
│   │   ├── Date+Ext.swift           # Date utilities
│   │   └── String+Ext.swift         # String validation
│   └── Managers/
│       └── NetworkManager.swift     # API communication
└── Assets.xcassets/                 # Images and colors

Appetizers-BE/
├── server.js                        # Express server
├── package.json                     # Node.js dependencies
└── public/                          # Static image files
```

## 🚀 Getting Started

### Prerequisites
- **iOS Development**: Xcode 15+ with iOS 18+ SDK
- **Backend**: Node.js 16+ and npm
- **Device/Simulator**: iOS 18+ device or simulator

### Installation

**Clone the repository**:
   ```bash
   git clone https://github.com/yassineelkefi/Appetizers.git
   ```

### Backend Setup

1. **Navigate to backend directory**:
   ```bash
   cd Appetizers-BE
   ```

2. **Install nodemon globally (if not already installed)**:
   ```bash
   npm install -g nodemon
   ```

3. **Install dependencies**:
   ```bash
   npm install
   ```

4. **Start the server**:
   ```bash
   npm start
   ```

5. **Verify server is running**:
   - Server runs on `http://localhost:3000`
   - Test endpoint: `http://localhost:3000/api/appetizers`

### iOS App Setup

1. **Open Xcode project**:
   ```bash
   open Appetizers.xcodeproj
   ```

2. **Update network configuration**:
   - Open `NetworkManager.swift`
   - Update `baseURL` with your machine's IP address:
   ```swift
   static let baseURL = "http://YOUR_IP_ADDRESS:3000/api/"
   ```

3. **Build and run**:
   - Select target device/simulator
   - Press `Cmd+R` to build and run

## 🔧 Configuration

### Network Settings
The app communicates with the backend via HTTP requests. Update the base URL in `NetworkManager.swift`:

```swift
static let baseURL = "http://192.168.1.3:3000/api/"
```

### App Settings
- **Development Team**: Update in project settings for code signing
- **Bundle Identifier**: `com.yassineelkefi.Appetizers`
- **Deployment Target**: iOS 14.0+

## 📡 API Endpoints

### Backend API Documentation

#### Get All Appetizers
```http
GET /api/appetizers
```
**Response**: Array of appetizer objects with 2-second delay simulation
```json
{
  "request": [
    {
      "id": 1,
      "name": "Mozzarella Sticks",
      "description": "Crispy breaded mozzarella cheese sticks served with marinara sauce",
      "protein": 18,
      "calories": 420,
      "carbs": 32,
      "price": 8.99,
      "imageURL": "http://localhost:3000/images/mozzarella-sticks.jpeg"
    }
  ]
}
```

#### Get Single Appetizer
```http
GET /api/appetizers/:id
```
**Response**: Single appetizer object or 404 error

## 💾 Data Models

### Appetizer Model
```swift
struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
```

### User Model
```swift
struct User: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var birthdate: Date
    var extraNapkins: Bool
    var frequentRefills: Bool
}
```

### Order Model
```swift
final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    var totalPrice: Double { /* calculated property */ }
    func add(_ appetizer: Appetizer)
    func deleteItems(at offsets: IndexSet)
}
```

## 🎨 Key Components

### Custom Views
- **`AppetizerRemoteImage`**: Async image loading with placeholder
- **`LoadingView`**: Branded loading spinner
- **`EmptyState`**: Empty state messaging
- **`APButton`**: Styled button component

### View Modifiers
- **`StandardButtonStyle`**: Consistent button styling across the app

### Extensions
- **`String+Ext`**: Email validation using RegexBuilder
- **`Date+Ext`**: Age-based date calculations

## ⚡ Features Deep Dive

### State Management
- **ObservableObject**: View models manage app state
- **EnvironmentObject**: Order shared across views
- **AppStorage**: User data persistence
- **Published Properties**: Reactive UI updates

### Error Handling
Comprehensive error handling with custom `APError` enum:
- `invalidURL`: Malformed API endpoints
- `invalidResponse`: Server response issues
- `invalidData`: JSON parsing errors
- `unableToComplete`: Network connectivity issues

### Form Validation
- **Email Validation**: RegexBuilder-based email verification
- **Required Fields**: Form completion checking
- **Age Restrictions**: Date picker with 18+ validation

### User Experience
- **Loading States**: Visual feedback during API calls
- **Empty States**: Helpful messaging for empty collections
- **Form Navigation**: Smooth field-to-field navigation
- **Haptic Feedback**: Native iOS interactions

## 🛠️ Development Notes

### Networking
- **Async/Await**: Modern Swift concurrency
- **Error Propagation**: Proper error handling chain
- **Main Actor**: UI updates on main thread

### Performance
- **Image Caching**: AsyncImage with fallback placeholders
- **Lazy Loading**: Efficient list rendering
- **Memory Management**: Proper object lifecycle

### Code Organization
- **MVVM Pattern**: Clear separation of concerns
- **Single Responsibility**: Focused, reusable components
- **Protocol Conformance**: Swift standard library integration

## 🔍 Testing

### Manual Testing Checklist
- [ ] Backend server starts successfully
- [ ] App connects to API endpoints
- [ ] Appetizer list loads with images
- [ ] Detail view displays correctly
- [ ] Order management works
- [ ] User account saves data
- [ ] Form validation functions
- [ ] Error states display properly

### Debug Configuration
- **Network Logging**: Monitor API requests in Xcode console
- **Simulator Testing**: Test on various device sizes
- **Error Simulation**: Test offline scenarios

## 🙏 Acknowledgments

- **SwiftUI**: Apple's modern UI framework
- **Express.js**: Fast Node.js web framework
- **AsyncImage**: Native image loading
- **Combine**: Reactive programming framework

---

**Author**: Yassine EL KEFI  
- GitHub: [@YassineElkefi](https://github.com/yassineelkefi)
- LinkedIn: [Yassine EL KEFI](https://www.linkedin.com/in/yassine-elkefi/)
- Portfolio: [yassineelkefi.com](https://yassineelkefidev-portfolio.vercel.app)
- Email: [yassine.elkefi6@gmail.com](mailto:yassine.elkefi6@gmail.com)
---
*Built with ❤️ for learning Swift, SwiftUI, and iOS development.*
