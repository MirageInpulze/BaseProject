// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CalculateAttack(mask_index)
{
var hitByAttackNow = ds_list_create();
var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);
if (hits > 0)
{
	for (var i = 0; i < hits; i++)
	{
		//If instance has not been hit by this attack, hit
		var hitID = hitByAttackNow[| i];
		if (ds_list_find_index(hitByAttack, hitID) == -1)
		{
			ds_list_add(hitByAttack, hitID);
			with(hitID)
			{
				
				
				if (entityHitScript != -1) script_execute(entityHitScript)
				
				
			}
			
		}
	}
}


mask_index = sPlayerWalk
}

function AttackSlash()
{
	if (sprite_index != sPlayerAttackSlash)
	{
		//Animation setup
		sprite_index =sPlayerAttackSlash
		localFrame = 0;
		image_index = 0;
		
		//Clear hitlist
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
		
	}
	
	CalculateAttack(sPlayerAttackSlashHB)
	
	FourDirectionAnimate();
	if (animationEnd)
	{
		state = PlayerWalking;
		animationEnd = false;
	}
}