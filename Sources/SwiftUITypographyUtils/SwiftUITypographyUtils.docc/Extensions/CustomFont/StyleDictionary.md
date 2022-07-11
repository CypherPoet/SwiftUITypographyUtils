# Creating A Style Dictionary

Create a ``CustomFont/StyleDictionary`` to control how a custom font scales with dynamic type content size.

## Overview

A style dictionary collects the base font metrics for each of the dynamic type text styles. You need to create a style dictionary for each custom font you want to use in your app.

A style dictionary is a property list file that you include with your app. It contains an entry for each supported text style. The available text styles correspond to those defined by the [Font.TextStyle](https://developer.apple.com/documentation/swiftui/font/textstyle) enumeration in SwiftUI:

- `largeTitle` 
- `title` 
- `title2` 
- `title3`
- `headline` 
- `subheadline` 
- `body` 
- `callout`
- `footnote` 
- `caption` 
- `caption2`


The value of each entry is a dictionary with two keys:


+ `fontName`: A `String` that matches the font's `Full name` as listed in the `Font Book` app.
+ `fontSize`: A number which is the point size to use at the `.large` (base) content size.

If you're not sure which font sizes to use for each style, refer to the typography section of the [Apple Human Interface Guidelines for iOS](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/). It lists the font metrics Apple uses for the default San Francisco font.

For example, to use a 17pt Prometo-Bold font for the `.headline` style at the `.large` content size:

```
<dict>
  <key>headline</key>
  <dict>
    <key>fontName</key>
    <string>Prometo-Bold</string>
    <key>fontSize</key>
    <integer>17</integer>
  </dict>
</dict>
```

> Note: 
>
> You do not need to include an entry for every text style. 
> However, if you try to use a text style that is not included in the dictionary, 
> it will fall back to the system-preferred font.


### Finding Font Names

To view the names of all currently-available, you can get them from various properties of the `UIFont` or `NSFont` classes at run time:

```swift
let familyNames = UIFont.familyNames.sorted()

// Print family names
familyNames.forEach { print($0) }

// Print all font names within each family name
familyNames.forEach { 
    print(UIFont.fontNames(forFamilyName: $0))
}
```

> Tip: 
>
> See the Demo App included in this package for [examples of listing 
> the currently-available fonts](https://github.com/CypherPoet/SwiftUITypographyUtils/blob/55117f57138e1ddcf2f20b6c1af2acacced53d7a/Examples/Demo%20Apps/DemoApp/DemoApp/Scene%20Views/Available%20Fonts%20/AvailableFontsDemoView.swift#L30) on a device.

> Note: 
> 
> The system-installed fonts are not the same for iOS, tvOS and watchOS platforms.


## Example Style Dictionaries

See the Demo App included in this package for some examples of creating style dictionaries for a ``CustomFont`` instance.

- [Prometo Font Settings](https://github.com/CypherPoet/SwiftUITypographyUtils/blob/cd0605e7487761156be5ac87fbce82f3a3e7eecd/Examples/Demo%20Apps/DemoApp/DemoApp/Resources/Fonts/Prometo/PrometoSettings.plist)
- [Soleto Font Settings](https://github.com/CypherPoet/SwiftUITypographyUtils/blob/cd0605e7487761156be5ac87fbce82f3a3e7eecd/Examples/Demo%20Apps/DemoApp/DemoApp/Resources/Fonts/Soleto/SoletoSettings.plist#L0-L1)

