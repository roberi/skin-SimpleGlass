[![](https://img.shields.io/badge/License-GPLv3-green.svg)](https://github.com/roberi/skin-SimpleGlass/blob/master/LICENSE)  [![](https://img.shields.io/github/downloads/roberi/skin-SimpleGlass/total)](https://github.com/roberi/skin-SimpleGlass/releases)  [![](https://img.shields.io/github/v/release/roberi/skin-SimpleGlass)](https://github.com/roberi/skin-SimpleGlass/releases)
-------
Skin SimpleGlass
================
SimpleGlass is a transparent variant of the clean, lightweight, and multi-resolution skin [SimpleGray](https://github.com/Taapat/skin-SimpleGray) created by [Taapat](https://github.com/Taapat).

Just like SimpleGray, the skin uses automatic scaling and is available for SD, HD, and Full HD resolutions. SVG graphics are used throughout the interface to ensure consistent image quality across all supported resolutions.

SimpleGlass requires an OpenPLi-based image with support for scaling and SVG rendering (OpenPLi 8.1 or later).

Differences from SimpleGray
---------------------------
SimpleGlass preserves the overall design and layout of SimpleGray while introducing a more transparent appearance.

- **Transparent Backgrounds**: All screens use a semi-transparent gray background instead of a solid gray background.
- **Transparent Screen Borders**: Screen border graphics have been redesigned using transparent PNG images.
- **Top Border Only**: Most screens use a top border only instead of having borders all around.
- **Refined Color Buttons**: The borders of the red, green, yellow, and blue color buttons use darker shades for improved contrast and visibility.

Installation
------------
1. Download the latest [Skin SimpleGlass release](https://github.com/roberi/skin-SimpleGlass/releases).

2. Transfer the IPK file to your receiver using FTP or SFTP and place it in:

    ```text
    /tmp
    ```

3. Connect to the receiver using SSH or a local terminal and install the package:

    ```bash
    opkg install /tmp/enigma2-plugin-skins-simple-glass_*.ipk
    ```

4. Open the Enigma2 skin settings and select SimpleGlass.

Development
-----------
SimpleGlass uses a standalone Makefile-based build process. To build the IPK package, simply run:

```bash
make
```

The build process compiles Python sources, creates the required package archives, and generates a distributable IPK package in:

```text
/ipk
```

Screenshots
-----------
![](https://user-images.githubusercontent.com/10847866/219873908-9e23695e-6530-4256-802e-1f36aad18008.jpg)

![](https://user-images.githubusercontent.com/10847866/219874278-d9e0fcdd-f71e-45ee-90e2-ada8b55171f3.jpg)

![](https://user-images.githubusercontent.com/10847866/219873783-e1ff33a6-95a7-4791-acfb-8b58fa82ac97.jpg)

![](https://user-images.githubusercontent.com/10847866/219873790-0cbf5e9b-c2b3-42cb-8279-36002224b78a.jpg)

![](https://user-images.githubusercontent.com/10847866/219873791-64808b6d-7133-42e6-9d02-1636d7ca84cb.jpg)

![](https://user-images.githubusercontent.com/10847866/219873799-af8b1fa5-9771-4e6b-a8e1-66c3daf22e88.jpg)

![](https://user-images.githubusercontent.com/10847866/219873801-f45c4533-f15b-42dd-b7bd-3d5893aa89f2.jpg)
