extends Node2D
class_name Interactible

"""
Interactible class

Base class for interatible objects. 
Set ups variables for interaction prompt and the action function 
(which should be overwritten in inherited classes)

The interactible object needs to have an Area2D/Collision node 
indicating the interactive area of the object.
"""

var interaction_prompt: String = "interact"
var show_prompt: bool = true

func action():
	print("Item action")