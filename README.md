# Grapes App

## Overview

The Grapes App is a SwiftUI-based iOS application designed to manage a collection of grape varieties. Users can add, edit, and delete grape entries. Each grape entry includes an image, a name, and a description. The app uses Core Data for local storage and provides a user-friendly interface to interact with the data.

## Features

- **View List of Grapes**: Displays a list of grape varieties with images and names.
- **Add New Grape**: Allows users to add a new grape variety with an optional image.
- **Edit Grape**: Provides functionality to edit existing grape details.
- **Delete Grape**: Enables users to delete a grape entry.
- **Detailed View**: Shows detailed information about a selected grape, including the image and description.

## Technology Stack

- **SwiftUI**: For building the user interface.
- **Core Data**: For data persistence and management.
- **UIKit**: Integrated for image picking functionality.

## File Descriptions

- **`ContentView.swift`**: Main view displaying a list of grape cards. Allows navigation to detailed views and adding new grapes.
- **`GrapeCardView.swift`**: Displays a card view for each grape, showing the image and name.
- **`GrapeDetailView.swift`**: Shows detailed information about a selected grape, with options to edit or delete.
- **`AddGrapeView.swift`**: Interface for adding a new grape entry with optional image upload.
- **`EditGrapeView.swift`**: Interface for editing an existing grape entry.
- **`ImagePicker.swift`**: Custom SwiftUI view for selecting an image from the photo library.
- **`PersistenceController.swift`**: Manages Core Data stack setup and provides sample data for previews.
- **`DataController.swift`**: Handles Core Data operations such as adding, editing, and deleting grape entries.

## Setup

### Prerequisites

- Xcode 15 or later
- An iOS device or simulator for testing
