/* AS3
	Copyright 2009 __velcrew__.
		www.velcrew.com
*/
package com.velcrew.maths
{
	
	/**
	 *	Static Class for randon numbers with min and max
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Luis Teixeira
	 *	@since  13.04.2009
	 */
	public class MathsUtils 
	{
		
		public static function Rnd(min:Number, max:Number):int
		{
			//if(max == NaN){max = min; min = 0};
			
			return Math.random() * (max - min) + min;
		}
	
	}
	
}
