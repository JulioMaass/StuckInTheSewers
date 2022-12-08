
function SurfaceCheckOrCreate(surface_name, width, height)
//surfaces may be destroyed when minimizing the game
//this function checks it and recreates them
{
	var surface = variable_instance_get(id, surface_name)
	if !surface_exists(surface)
	{
	    surface = surface_create(width,height);
		variable_instance_set(id, surface_name, surface);
	}
}