<<<<<<< HEAD
// Copyright (C) 2018 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Original contribution: FOSSEE, IIT Bombay
// Original Source : https://octave.sourceforge.io/signal/
// Modifieded by: Sonu Sharma, RGIT Mumbai
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in


function [zero, pole, gain]=besselap(n)
    //Bessel analog filter prototype.

    //Calling Sequence
    //[zero, pole, gain] = besselap(n)
    //zero = besselap(n)

    //Parameters 
    //n: Filter Order
    //zero: Zeros
    //pole: Poles
    //gain: Gain

    //Description
    //It Return bessel analog filter prototype of nth order.

    //Examples
    //[zero, pole, gain] = besselap (5)
    //Output :
    // gain  =
    // 
    //    1.  
    // pole  =
    // 
    //  - 0.5905759 + 0.9072068i  
    //  - 0.5905759 - 0.9072068i  
    //  - 0.9264421               
    //  - 0.8515536 + 0.4427175i  
    //  - 0.8515536 - 0.4427175i  
    // zero  =
    // 
    //     []
    
    

    funcprot(0);
    [nargout, nargin] = argn() ;

    if (nargin>1 | nargin<1)
        error("besselap : wrong number of input argument")
    end

    // interpret the input parameters
    if (~(length(n)==1 & n == round(n) & n > 0))
        error ("besselap: filter order n must be a positive integer");
    end

    p0=1;
    p1=[1 1];
    for nn=2:n
        px=(2*nn-1)*p1;
        py=[p0 0 0];
        px=prepad(px,max(length(px),length(py)),0);
        py=prepad(py,length(px));
        p0=p1;
        p1=px+py;
    end
    // p1 now contains the reverse bessel polynomial for n

    // scale it by replacing s->s/w0 so that the gain becomes 1
    p1=p1.*p1(length(p1)).^((length(p1)-1:-1:0)/(length(p1)-1));

    zero=[];
    pole=roots(p1);
    gain=1;

=======
function [zero, pole, gain] = besselap (n)
//Return bessel analog filter prototype.
//Calling Sequence
//[zero, pole, gain] = besselap (n)
//[zero, pole] = besselap (n)
//zero = besselap (n)
//Parameters 
//n: Filter Order
//zero: Zeros
//pole: Poles
//gain: Gain
//Description
//This is an Octave function.
//It Return bessel analog filter prototype of nth order.
//Examples
//[zero, pole, gain] = besselap (5)
//zero = [](0x0)
//pole =
//
//  -0.59058 + 0.90721i
//  -0.59058 - 0.90721i
//  -0.92644 + 0.00000i
//  -0.85155 + 0.44272i
//  -0.85155 - 0.44272i
//
//gain =  1

funcprot(0);
lhs = argn(1)
rhs = argn(2)
if (rhs < 1 | rhs > 1)
error("Wrong number of input arguments.")
end

select(rhs)
	
	case 1 then
		if(lhs==1)
		zero = callOctave("besselap",n)
		elseif(lhs==2)
		[zero, pole] = callOctave("besselap",n)
		elseif(lhs==3)
		[zero, pole, gain] = callOctave("besselap",n)
		else
		error("Wrong number of output argments.")
		end
	end
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
endfunction
