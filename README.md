# Ameeko

A simple SwiftUI demo app for location-based social posts. The project is
provided as a Swift Package. Open `Package.swift` in Xcode 13 or later to build
and run.

## Features

* Register and login with a local in-memory store
* Create posts with a visibility radius
* Comment on posts
* Send messages to other users

All data is stored locally during runtime; no backend services are required.

Login and registration now persist the created user in an in-memory `DataStore`
so the profile tab reflects the currently authenticated user.
