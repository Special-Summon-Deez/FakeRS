extends Resource

class_name Inv

@export var slots:Array[InvSlot]

signal update

func Insert(item: InvItem):
#	This line takes the existing array of slots, an filters the array into a second array.
#	This second array holds all slots that have that item passed into our function
#	Lambda function takes in the current slot, then returns it to the second array if it has the item
	var itemSlots = slots.filter(func(slot): return slot.item == item)
	if !itemSlots.is_empty():
		itemSlots[0].amount += 1
	else:
#		This array line will also take the existing array, but only return the slotos that are empty. We write to the first empty index if available
		var emptySlots = slots.filter(func(slot): return slot.item == null)
		if !emptySlots.is_empty():
			emptySlots[0].item = item
			emptySlots[0].amount = 1
	update.emit()
