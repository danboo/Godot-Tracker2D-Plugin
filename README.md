# Tracker2D

## Description

`Tracker2D` is a Godot 4.0 plugin that lets you visually track node position and orientation along
with a textual representation of various properties. In some respects it is combination of
`Marker2D` and the "Remote" scene view, but is visible during game execution instead of in the
editor, and makes the visual association of nodes and their properties immediately apparent.

By default it reports the `position`, `rotation`, `global_position`, and `global_rotation`
properties, but you can specify an array of user-defined properties to track in addition to the
defaults.

### Example

![Example](example.png "Example")

In the example above, the red-tinted Godot logo has a `Tracker2D` as a child, configured to also
report the `modulate` value.

The larger, untinted Godot logo is intended to show that the `Tracker2D` information (e.g, the
bounding box) is drawn on top of the scene, so it won't be occluded by other game visuals.

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
