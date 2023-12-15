// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Inventory() constructor {
	_inventory_items = []
	_max_qty = 64
	
	item_set = function(_name, _quantity, _sprite) {
		var i = (_quantity - _max_qty)
		if(i > 0){
			_quantity = _max_qty
		}
		
		array_push(_inventory_items, {
			name: _name,
			quantity: _quantity,
			sprite: _sprite, 
		})
		
		if(i > 0){
			item_set(_name, i, _sprite)
		}
	}
	
	
	item_find = function(_name) {
		for(var _i = array_length(_inventory_items) - 1; _i >= 0; _i--){
			if(_name == _inventory_items[_i].name){
				return _i
			}
		}
		return -1
	}
	
	item_add = function(_name, _quantity, _sprite) {
		var index = item_find(_name)
		
		if(index >= 0 && _inventory_items[index].quantity + _quantity <= _max_qty){
			 _inventory_items[index].quantity += _quantity
		}
		else{
			item_set(_name, _quantity, _sprite) 
		}
		
//		if(index >= 0 && _inventory_items[index].quantity + _quantity > _max_qty){
//			_inventory_items[index].quantity = _max_qty
//			
//			var remaining =  _inventory_items[index].quantity + _quantity - _max_qty
//			item_set(_name, remaining, _sprite)
//		}
	}
	
	item_has = function(_name, _quantity){
		var index = item_find(_name)
		
		if(index >= 0){
			return _inventory_items[index].quantity >= _quantity
		}
		
		return false
	}
	
	item_subtract = function(_name, _quantity){
		var index = item_find(_name)
		
		if(index >= 0){
			if(item_has(_name, _quantity)){
				_inventory_items[index].quantity -= _quantity
				
				if(_inventory_items[index].quantity == 0){
					item_remove(index)
				}
				
//				if(_inventory_items[index].quantity < 0){
//					var remaining = abs(_inventory_items[index].quantity)
//					item_remove(index)
//					
//					item_subtract(_name, remaining)
//				}
			}
		}
	}
	
	item_remove = function(_index){
		array_delete(_inventory_items, _index, 1)
		
	}
	
	toString = function(){
		return json_stringify(_inventory_items)
	}
}