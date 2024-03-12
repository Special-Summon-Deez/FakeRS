extends Panel

@onready var amount = $CenterContainer/Panel/amount
@onready var item_display= $CenterContainer/Panel/item_display

func update(slot:InvSlot):
	if !slot.item:
		item_display.visible = false
		amount.visible = false
	else:
		item_display.visible = true
		item_display.texture = slot.item.texture
		if (slot.amount > 1):
			amount.visible = true
		amount.text = str(slot.amount)
		
	
