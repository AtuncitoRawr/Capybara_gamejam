//Agarrar items

function scrItem_add(_item)
{
	
	var _added = false;
	
	if array_length(oItem_manager.inv) < oItem_manager.inv_max
	{
		array_push(oItem_manager.inv, _item);
		_added = true;
	}
	
	return _added;
}