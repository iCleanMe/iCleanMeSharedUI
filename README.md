
# iCleanMeSharedUI

### Overview
**iCleanMeSharedUI** is a Swift package that contains shared UI components for the iCleanMe app. This package provides reusable SwiftUI views, modifiers, and utilities that are used across different modules within the app. It is designed to promote consistency and reusability in the user interface of iCleanMe.

### Features
- **Reusable Components**: A collection of reusable views and modifiers to standardize UI elements across the iCleanMe app.
- **Integration with NnSwiftUIKit**: Relies on `NnSwiftUIKit`, a custom Swift package, to extend SwiftUI capabilities and simplify UI development.
- **Custom Styles**: Includes custom button styles, text field styles, toggle styles, and more, tailored to fit the aesthetic of the iCleanMe app.
- **Error Handling**: Provides utilities for error handling and displaying alerts using SwiftUI.

### Usage
Here are some examples of how to use components from `iCleanMeSharedUI`:

#### Custom Button
```swift
import iCleanMeSharedUI

struct ContentView: View {
    var body: some View {
        TryButton("Press Me", role: .cancel) {
            // Handle the action
        }
    }
}
```

#### Custom Background

```swift
import iCleanMeSharedUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .withGradientBackground(.seaNight)
    }
}
```

### Dependencies
- **NnSwiftUIKit**: This package depends on [NnSwiftUIKit](https://github.com/nikolainobadi/NnSwiftUIKit) to enhance the capabilities of SwiftUI, providing additional components and utilities.


### License
iCleanMeSharedUI is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
