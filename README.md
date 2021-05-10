# SwiftXML

Using XML in Swift (experimental, in development).

## Usage on Windows

1. Install Visual Studio (get it from [https://visualstudio.microsoft.com](https://visualstudio.microsoft.com)).

2. Install CLion (get it from [https://www.jetbrains.com/clion](https://www.jetbrains.com/clion)).

3. Install the Swift toolchain (get it from [https://swift.org/download](https://swift.org/download)).

4. Start Clion.

5. Configure the Swift toolchain in CLion.

6. Open the Swift package in CLikon (open `Package.swift` in CLion and choose "open as project").

7. Include the `SwiftXML` package:
   
   In `Package.swift` add the following inside the dependencies at teh top-level of the package:

    ```swift
        .package(url: "[https://github.com/stefanspringer1/SwiftXML.git](https://github.com/stefanspringer1/SwiftXML.git)", from: "0.0.1"),
    ```

    For the target, add the following dependency:

    ```swift
        .product(name: "SwiftXML", package: "SwiftXML")
    ```

8. Open (in CLion) `main.swift` and add the following code (use your paths):

    ```swift
    _ = XMLDocument(document: "my path to the XML document", catalog: "my path to the catalog")
    ```

9. Click the run symbol in CLion.