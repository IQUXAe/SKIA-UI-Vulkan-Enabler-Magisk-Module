# SKIA UI Vulkan Enabler (Fork)

This module is a simplified and forced fork of the original [SKIA UI Renderer Enabler](https://github.com/reiryuki/SKIA-UI-Renderer-Enabler-Magisk-Module).

## Description
This fork forcibly enables **Skia Vulkan (SkiaVK)** rendering for the Android UI system.
Unlike the original module which offers switching options, this version is hardcoded to:
- Force `debug.hwui.renderer` to `skiavk`
- Force `debug.renderengine.backend` to `skiavkthreaded`

This is intended for devices where you explicitly want to enforce Vulkan rendering for better performance or compatibility, removing the legacy OpenGL fallback logic.

## Requirements
- Magisk, KernelSU, Apatch, or Kitsune Mask
- Android device with hardware Vulkan support

## Installation
Flash via your root manager (Magisk/KSU/etc).
The module applies properties immediately, but a reboot is recommended to ensure the render engine initializes correctly with the new backend.

## Credits & Upstream
- **Original Author**: [Rei Ryuki the Fixer](https://github.com/reiryuki/SKIA-UI-Renderer-Enabler-Magisk-Module)
- **Fork Author**: IQUXAe

For support regarding the **original** functionality, please refer to the original repository.
For issues specific to this forced-Vulkan implementation, open an issue in this repository.
