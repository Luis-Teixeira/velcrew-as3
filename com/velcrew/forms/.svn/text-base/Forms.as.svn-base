/* AS3
	Copyright 2009 __velcrew__.
		www.velcrew.com
*/
package com.velcrew.forms
{
	
	/**
	 *	Forms Validators
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Luis Teixeira
	 *	@since  13.04.2009
	 */
	public class Forms
	{
		public static function validateString(str:String, n:Number = 1): Boolean
		{
				
			if(str.length >= n)
			{
				return true;
			}else{
				return false;
			}
			
		}
		
		public static function validateEmail(str:String): Boolean
		{
			
			var pattern:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
			var result:Object = pattern.exec(str);
			if (result==null) 
			{
				return false;
			}
			return true;	
		}
		
		public static function validateMobilePhonePT(str:String, n:Number = 9): Boolean
		{		
			var pattern:RegExp = /^9\d{8}$/;
			var result:String = pattern.exec(str);
			if(result)
			{
				if (result.length >= n) 
				{
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}		
		}
		
		public static function validateNumber(str:String, n:Number = 1): Boolean
		{	
					
			var pattern:RegExp = /\d*/;
			var result:String = pattern.exec(str);
			if (result.length >= n ) 
			{
				return true;
			} else {
				return false;
			}
				
		}
		
		public static function validateClock(str:String, n:Number = 24): Boolean
		{	
			switch (n)
			{
				case 12:
					n = 12;
					break;
				case 24:
					n = 24;
					break;
				default:
					n =24;				
			}
			
			var pattern:RegExp = /^[012]?\d:[012345]\d$/
			var result:String = pattern.exec(str);
			if (result == null) 
			{
				return false;
			}
			return true;	
		}
	
	}
	
}
