/* AS3
	Copyright 2009 __velcrew__.
*/
package com.velcrew.toplevel
 {
	
	/**
	 *	Class toplevel utils.
	 *	
	 *	Some util to lead with toplevel objects
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Luis Teixeira
	 *	@since  13.08.2009
	 */

	public class Utils
	{
		
		public static function objLength(obj:Object, list:Boolean = false):uint
		{
			var len:uint = 0;
			
			for (var item:String in obj)
			{
				if(list)trace("index --> ", len , " | obj var name --> " ,item , " | value --> ", obj[item]);
				len++;
			}			   
			
			return len;		
	}
	
}
