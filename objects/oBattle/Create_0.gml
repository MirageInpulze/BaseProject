/// @description Insert description here
// You can write your code in this editor
instance_deactivate_all(true);

units = [];

//Create enemies
for (var i = 0; i < array_length(enemies); i++)
	{
		enemyUnits[i] = instance_create_depth(x+250+(i*10), y+68+(i*20), depth-10, oBattleUnitEnemy, enemies[i]);
		array_push(units, enemyUnits[i]);
	
	}
	
//Create players
for (var i = 0; i < array_length(global.party); i++)
	{
		partyUnits[i] = instance_create_depth(x+70+(i*10),y+68+(i*15), depth-10, oBattleUnitPC, global.party[i]);
		array_push(units, partyUnits[i]);
	
	}