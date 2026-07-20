extends Control

var _money := 0
var _per_click := 1
var _per_sec := 0

@onready var money_label: Label = $VBox/MoneyLabel
@onready var click_button: Button = $VBox/ClickButton
@onready var income_timer: Timer = $IncomeTimer

func _ready() -> void:
	click_button.pressed.connect(_on_click)
	income_timer.timeout.connect(_on_income)
	income_timer.start()
	_update_label()

func _on_click() -> void:
	_money += _per_click
	_update_label()

func _on_income() -> void:
	_money += _per_sec
	_update_label()

func _update_label() -> void:
	money_label.text = "Para: %d" % _money
