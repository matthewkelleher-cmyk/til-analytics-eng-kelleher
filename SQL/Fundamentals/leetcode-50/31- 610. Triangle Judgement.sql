select 
* 
, if(((x+y+z) - greatest(x,y,z)) > greatest(x,y,z), "Yes", "No"  ) as triangle
from 
triangle 