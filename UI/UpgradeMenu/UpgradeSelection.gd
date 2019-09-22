extends Control

onready var slot1: Button = $UpgradeSlot
onready var slot2: Button = $UpgradeSlot2
onready var slot3: Button = $UpgradeSlot3

var upgrade1: Upgrade
var upgrade2: Upgrade
var upgrade3: Upgrade

func _ready() -> void:
	upgrade1 = Upgrades.get_random_upgrade()
	slot1.setup(upgrade1.image, upgrade1.title, upgrade1.description )
	upgrade2 = Upgrades.get_random_upgrade()
	slot2.setup(upgrade2.image, upgrade2.title, upgrade2.description )
	upgrade3 = Upgrades.get_random_upgrade()
	slot3.setup(upgrade3.image, upgrade3.title, upgrade3.description )
	
	slot2.grab_focus()


func _on_UpgradeSlot_pressed() -> void:
	upgrade1.apply()
	GameState.next_beacon()


func _on_UpgradeSlot2_pressed() -> void:
	upgrade2.apply()
	GameState.next_beacon()

func _on_UpgradeSlot3_pressed() -> void:
	upgrade3.apply()
	GameState.next_beacon()
