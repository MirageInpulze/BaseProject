// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// @param _num1
// @param _num2
// @param _amount 
function merge_number(_num1, _num2, _amount){
	var _diff = _num1 = _num2
	var _merged = _num1 - (_diff * _amount)
	return _merged
}