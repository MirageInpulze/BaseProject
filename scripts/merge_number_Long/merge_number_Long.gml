// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@description merge_number
///@arg num1
///@arg num2
///@arg amount

function merge_number_Long(_num1, _num2, _amount)
{
	// var _num1 =	argument0;
	// var _num2 = argument1;
	// var _amount = argument2; // the amount of num1 that is going to be replaced by num2


	var _diff = _num1 - _num2;
	var _merged = _num1 - (_diff * _amount); // Pretty much num1*(1 - amount) + num2*amount

	return _merged;
	
}
