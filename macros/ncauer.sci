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

function [Zz, Zp, Zg] = ncauer(Rp, Rs, n)
//Analog prototype for Cauer filter (Cauer filter and elliptic filters are same).

//Calling Sequence
//[Zz, Zp, Zg] = ncauer(Rp, Rs, n)

//Parameters 
//n: Filter Order
//Rp: Peak-to-peak passband ripple in dB
//Rs: Stopband attenuation in dB

//Description
//It gives an analog prototype for Cauer filter of nth order, with a Peak-to-peak passband ripple of Rp dB and a stopband attenuation of Rs dB.


=======
function [Zz, Zp, Zg] = ncauer(Rp, Rs, n)
//Analog prototype for Cauer filter.
//Calling Sequence
//[Zz, Zp, Zg] = ncauer(Rp, Rs, n)
//[Zz, Zp] = ncauer(Rp, Rs, n)
//Zz = ncauer(Rp, Rs, n)
//Parameters 
//n: Filter Order
//Rp: Peak-to-peak passband ripple
//Rs: Stopband attenuation
//Description
//This is an Octave function.
//It designs an analog prototype for Cauer filter of nth order, with a Peak-to-peak passband ripple of Rp and a stopband attenuation of Rs.
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
//Examples
//n = 5;
//Rp = 5;
//Rs = 5;
//[Zz, Zp, Zg] = ncauer(Rp, Rs, n)
<<<<<<< HEAD

=======
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
//Zz =
//
//   0.0000 + 2.5546i   0.0000 + 1.6835i  -0.0000 - 2.5546i  -0.0000 - 1.6835i
//
//Zp =
//
//  -0.10199 + 0.64039i  -0.03168 + 0.96777i  -0.10199 - 0.64039i  -0.03168 - 0.96777i  -0.14368 + 0.00000i
//
//Zg =  0.0030628

<<<<<<< HEAD

=======
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
funcprot(0);
lhs = argn(1)
rhs = argn(2)
if (rhs < 3 | rhs > 3)
<<<<<<< HEAD
error("ncauer : Wrong number of input arguments.")
end

[Zz, Zp, Zg] = ellipap(n, Rp, Rs) ; 

=======
error("Wrong number of input arguments.")
end

select(rhs)
	
	case 3 then
		if(lhs==1)
		Zz = callOctave("ncauer", Rp, Rs, n)
		elseif(lhs==2)
		[Zz, Zp] = callOctave("ncauer", Rp, Rs, n)
		elseif(lhs==3)
		[Zz, Zp, Zg] = callOctave("ncauer", Rp, Rs, n)
		else
		error("Wrong number of output argments.")
		end
	end
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
endfunction
