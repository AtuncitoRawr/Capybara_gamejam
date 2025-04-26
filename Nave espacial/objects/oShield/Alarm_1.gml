for (var i = 0 ; i < 12 ; i++)
{
	if alarm_get(i) > 0
	alarm_set(i, -1)
	loop = false
}