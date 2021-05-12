# SwiftXML

This is a Swift package for using XML in Swift (experimental, in development).

It currently uses libxml2 for validation (it uses the implementation from [Libxml2Validation](https://github.com/stefanspringer1/Libxml2Validation) for sevaral platforms), and an XML catalog is currently necessary for validation.

Later a validation using Xerces-C++ could be added (binaries for Xerces-C++ are available in [XercesBuild](https://github.com/stefanspringer1/XercesBuild)), this would be important if one would like to validate against W3C schema.

## Usage on Windows (for Development)

_**May 11, 2021:** Note that because of the Swift bug [SR-14578](https://bugs.swift.org/browse/SR-14578) you currently have to choose a Swift toolchain for Windows from the Snapshots, which could contain some other errors, as the Snapshots are not as thoroughly tested as the releases. (Some of those problems might result from the fact that the `Foundation` library was recently split into into the three libraries `Foundation`, `FoundationNetwork`, and `FoundationXML`.) With Swift version 5.5 this should be resolved soon._

0. The Swift Package Manager (SPM) uses symbolic links so you need the SeCreateSymbolicLinkPrivilege privilege to use the SPM on Windows. You could instead activate the Developer Mode on Windows (in the Windows settings, search "Developer" to find the according setting). According to [Enable your device for development](https://docs.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development), Microsoft recommends the Developer Mode for software development. Note that it is possible that the domain policy is overriding the local policy you set.

1. Install Visual Studio (get it from [https://visualstudio.microsoft.com](https://visualstudio.microsoft.com)).
   
2. Install the Swift toolchain (get it from [https://swift.org/download](https://swift.org/download)). Swift will be installed to `C:\Library`. In a newly opened comamnd line winmdows, the command `swift -version` should then print the Swift version.

3. You will have to make the Windows SDK accessable to Swift. Open the `x64 Native Tools for VS2019 Command Prompt` with Administrator rights (via the context menu of the entry for `x64 Native Tools for VS2019 Command Prompt` in the start menu) and inside it, execute the following commands. (Please also see the documentation [https://swift.org/getting-started/](https://swift.org/getting-started/) in case something has changed.)

```batch
copy %SDKROOT%\usr\share\ucrt.modulemap "%UniversalCRTSdkDir%\Include\%UCRTVersion%\ucrt\module.modulemap"
copy %SDKROOT%\usr\share\visualc.modulemap "%VCToolsInstallDir%\include\module.modulemap"
copy %SDKROOT%\usr\share\visualc.apinotes "%VCToolsInstallDir%\include\visualc.apinotes"
copy %SDKROOT%\usr\share\winsdk.modulemap "%UniversalCRTSdkDir%\Include\%UCRTVersion%\um\module.modulemap"
```

4. Different options could be considered for editing Swift source code. We describe the usage of CLion, a commercial IDE. You can get the installer from [https://www.jetbrains.com/clion](https://www.jetbrains.com/clion).

5. Create a new empty directory, and inside it, create a new Swift package by executing the command line `swift package init --type executable` in a newly opened command line window. Some files will then be created inside this directory.

6. Start Clion.

7. Add the Swift plugin via the CLion Settings dialog.

8. Configure the Swift toolchain in CLion (the settings for the Swift plugin might be the last entry in the Settings dialog). Choose the toolchain under `C:\Library\Developer\Toolchains` (select the subdirectory in `Toolchains`).

9. Open the Swift package you created in CLion (open `Package.swift` in CLion and choose "open as project").

10. Include the `SwiftXML` package:
   
In `Package.swift` add the following inside the dependencies at the top-level of the package:

```swift
.package(url: "https://github.com/stefanspringer1/SwiftXML.git", from: "0.0.13"),
```

For the target, add the following dependency:

```swift
.product(name: "SwiftXML", package: "SwiftXML"),
```

11.  Open `main.swift` in CLion and add the following code (use your paths):

```swift
_ = XMLDocument(document: "my path to the XML document", catalog: "my path to the catalog")
```

The second argument is optional. The argument names might change in later versions. There is an example project [SwiftXMLExample](https://github.com/stefanspringer1/SwiftXMLExample) to compare to.

Note that, if you want to use a catalog file, an _XML_ catalog is needed here. Also note that paths containing non-ASCII characters might pose a problem at the current state.

12.  Click the Run symbol in CLion. (You can also execute `swift build -c release` for building or `swift run -c release` for also running inside your package. The Swift plugin for CLion is quite new, so this might even be necessary.) With the current state of the project (May 11, 2021) the document should then get validated, validation errors printed, and entity definitions and their usage will be displayed.