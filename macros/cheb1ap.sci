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

function [z, p, g] = cheb1ap (n, Rp)
    //This function designs a lowpass analog Chebyshev type I filter.

    //Calling Sequence
    //[z, p, g] = cheb1ap (n, Rp)

    //Parameters 
    //n: Filter Order
    //Rp: Peak-to-peak passband ripple (in dB)
    //z: Zeros
    //p: Poles
    //g: Gain

    //Description
    //It gives a lowpass analog Chebyshev type I filter of nth order and with a Peak-to-peak passband ripple of Rp.

    //Examples
    //[z, p, g] = cheb1ap (10, 3)
    //Output :
    // g  =
    // 
    //    0.0019578  
    // p  =
    // 
    //  - 0.0138320 - 0.9915418i  
    //  - 0.0401419 - 0.8944827i  
    //  - 0.0625225 - 0.7098655i  
    //  - 0.0787829 - 0.4557617i  
    //  - 0.0873316 - 0.1570448i  
    //  - 0.0873316 + 0.1570448i  
    //  - 0.0787829 + 0.4557617i  
    //  - 0.0625225 + 0.7098655i  
    //  - 0.0401419 + 0.8944827i  
    //  - 0.0138320 + 0.9915418i  
    // z  =
    // 
    //     []

    funcprot(0);
    lhs = argn(1)
    rhs = argn(2)
    if (rhs < 2 | rhs > 2)
        error("cheb1ap: Wrong number of input arguments.")
    end

    Rpf = 10 ^ (-Rp/20);    //passband pick to pick ripple in fraction
    rp = 1 - Rpf ;          //analpf function compitable passband ripple (delta-p)
    [hs,p,z,g]=analpf(n,"cheb1",[rp 0],1); //cutoff frequency of 1 rad/sec for prototype filter
    p = p' ;
    z = z' ;
    g = abs(g);

=======
function [z, p, g] = cheb1ap (n, Rp)
//This function designs a lowpass analog Chebyshev type I filter.
//Calling Sequence
//[z, p, g] = cheb1ap (n, Rp)
//[z, p] = cheb1ap (n, Rp)
//p = cheb1ap (n, Rp)
//Parameters 
//n: Filter Order
//Rp: Peak-to-peak passband ripple
//z: Zeros
//p: Poles
//g: Gain
//Description
//This is an Octave function.
//It designs a lowpass analog Chebyshev type I filter of nth order and with a Peak-to-peak passband ripple of Rp.
//Examples
//[z, p, g] = cheb1ap (10, 20)
//z = [](0x0)
//p =
//
// Columns 1 through 6:
//
//  -0.00157 - 0.98774i  -0.00456 - 0.89105i  -0.00709 - 0.70714i  -0.00894 - 0.45401i  -0.00991 - 0.15644i  -0.00991 + 0.15644i
//
// Columns 7 through 10:
//
//  -0.00894 + 0.45401i  -0.00709 + 0.70714i  -0.00456 + 0.89105i  -0.00157 + 0.98774i
//
//g =  1.9630e-04 - 6.3527e-22i

funcprot(0);
lhs = argn(1)
rhs = argn(2)
if (rhs < 2 | rhs > 2)
error("Wrong number of input arguments.")
end

select(rhs)
	
	case 2 then
		if(lhs==1)
		z = callOctave("cheb1ap", n, Rp)
		elseif(lhs==2)
		[z, p] = callOctave("cheb1ap", n, Rp)
		elseif(lhs==3)
		[z, p, g] = callOctave("cheb1ap", n, Rp)
		else
		error("Wrong number of output argments.")
		end
	end
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
endfunction
