<<<<<<< HEAD
// Copyright (C) 2018 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author:Sonu Sharma, RGIT Mumbai
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in

function [z, p, g] = buttap (n)
    //Produces analog prototype Butterworth filter

    //Calling Sequence
    //[z, p, g] = buttap (n)

    //Parameters 
    //n: Filter Order
    //z: Zeros
    //p: Poles
    //g: Gain

    //Description
    //It gives a lowpass analog prototype Butterworth filter of nth order.

    //Examples
    //[z, p, g] = buttap(5)
    //Output :
    // g  =
    // 
    //    1.  
    // p  =
    // 
    //  - 0.3090170 - 0.9510565i  
    //  - 0.8090170 - 0.5877853i  
    //  - 1. - 1.225D-16i         
    //  - 0.8090170 + 0.5877853i  
    //  - 0.3090170 + 0.9510565i  
    // z  =
    // 
    //     []


    funcprot(0);
    lhs = argn(1)
    rhs = argn(2)
    if (rhs < 1 | rhs > 1)
        error("buttap: Wrong number of input arguments.")
    end

    [Hs, p, z, g] = analpf(n, "butt", [],1 );
    p = p' ;
    z = z' ;

=======
function [z, p, g] = buttap (n)
//Design a lowpass analog Butterworth filter.
//Calling Sequence
//z = buttap (n)
//[z, p] = buttap (n)
//[z, p, g] = buttap (n)
//Parameters 
//n: Filter Order
//z: Zeros
//p: Poles
//g: Gain
//Description
//This is an Octave function.
//It designs a lowpass analog Butterworth filter of nth order.
//Examples
//[z, p, g] = buttap (5)
//z = [](0x0)
//p =
//
//  -0.30902 + 0.95106i  -0.80902 + 0.58779i  -1.00000 + 0.00000i  -0.80902 - 0.58779i  -0.30902 - 0.95106i
//
//g =  1


funcprot(0);
lhs = argn(1)
rhs = argn(2)
if (rhs < 1 | rhs > 1)
error("Wrong number of input arguments.")
end

select(rhs)
	
	case 1 then
		if(lhs==1)
		z = callOctave("buttap",n)
		elseif(lhs==2)
		[z, p] = callOctave("buttap",n)
		elseif(lhs==3)
		[z, p, g] = callOctave("buttap",n)
		else
		error("Wrong number of output argments.")
		end
	end
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
endfunction
