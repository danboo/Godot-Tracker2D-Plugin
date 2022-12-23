# Tracker2D

A Godot 4.0 plugin that lets you visually track node properties (position, rotation, custom properties).

## Description

This plugin provides custom node called `Tracker2D` that you can add as a child to a node of
interest, allowing you to visually monitor its position, rotation and user-specified properties.

### Example

![Example](example.png "Example")

## Installation Instructions

1. Copy the plugin directory contents into your project as `res://addons/Tracker2D/*`.
2. Enable the plugin via the menus: `Project` -> `Project Settings...` -> `Plugins` -> `Enable`

## Basic Usage Instructions

The simplest usage is to instantiate a `Tracker2D` node, configure its properties as desired, and
add it as a child of a node you want to track.

### Example via scripting:

```gdscript
var tracker_2d_scene : PackedScene = preload("res://addons/Tracker2D/tracker_2d.tscn")
var tracker_2d : Tracker2D = tracker_2d_scene.instantiate()
tracker_2d.display_position = false
tracker_2d.tracked_properties = [ "modulate" ]
node_of_interest.add_child(tracker_2d)
```

### Example via "Scene" UI:
	
Locate node of interest and use right-click -> "Instantiate Child Scene" to add an instance of
`res://addons/Tracker2D/tracker_2d.tscn` as a child. Use the "Inspector" of the `Tracker2D` node to
configure its properties as desired.

## Tracker2D Configuration


## Auto-tracking nodes by name, class or group

## Changes

## TODO
