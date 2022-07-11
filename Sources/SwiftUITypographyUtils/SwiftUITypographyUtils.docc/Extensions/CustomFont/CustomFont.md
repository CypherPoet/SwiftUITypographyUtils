# ``SwiftUITypographyUtils/CustomFont``

A structured approach to styling and dynamically scaling custom fonts.


## Overview

Supporting dynamic type with a custom font requires two things:

1. Defining a base font with a weight and size for each of the possible [text styles](https://developer.apple.com/documentation/swiftui/font/textstyle) 
at the Large (Default) content size.

2. Scaling the base font across the range of dynamic type content sizes.


The main challenge is properly structuring and configuring this inside of an application -- and then maintaining that code
as you continue to make changes to them.

To help with this, the ``CustomFont`` type collects them into a ``CustomFont/StyleDictionary`` -- stored as a property list file that, by default, is included in the main app's main bundle.


## Topics

### Configuring `CustomFont` Settings

- <doc:StyleDictionary>
