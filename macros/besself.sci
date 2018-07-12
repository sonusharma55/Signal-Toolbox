<<<<<<< HEAD
// Copyright (C) 2018 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Original Source : https://octave.sourceforge.io/signal/
// Modifieded by:Sonu Sharma, RGIT Mumbai
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in

function [a, b, c, d] = besself (n, w, varargin)
    //Bessel filter design.

    //Canding Sequence
    //[b, a] = besself(n, Wc)
    //[b, a] = besself (n, Wc, "high")
    //[b, a] = besself (n, [Wl, Wh])
    //[b, a] = besself (n, [Wl, Wh], "stop")
    //[z, p, g] = besself (…)
    //[…] = besself (…, "z")


    //Parameters 
    //n: positive integer value (order of filter)
    //W: positive real value, 
    //    1).Analog cutoff frequency/frequencies for analog filter, in the range [0, Inf] {rad/sec}
    //    2).Normalised digital cutoff frequency/frequencies for digital filter, in the range [0, 1] {dimensionless}

    //Description
    //This function generates a Bessel filter. The default is a Laplace space (s)  or analog filter.
    //If second argument is scalar the third parameter takes in high or low, the default value being low. The cutoff is Wc rad/sec.
    //If second argument is vector of length 2 ie [Wl Wh] then third parameter may be pass or stop default is pass for bandpass and band reject filter respectively
    //[z,p,g] = besself(...) returns filter as zero-pole-gain rather than coefficients of the numerator and denominator polynomials.
    //[...] = besself(...,’z’) returns a discrete space (Z) filter. Wc must be less than 1 {dimensionless}.


    //Examples
    //[b, a]=besself(2,.3,"high","z")
    //Output :
    // a  =
    // 
    //    1.  - 0.6912562    0.1760353  
    // b  =
    // 
    //    0.4668229  - 0.9336457    0.4668229  
    // 

    funcprot(0);
    [nargout nargin] = argn();

    if (nargin > 4 | nargin < 2 | nargout > 4 | nargout < 2)
        error("besself: invalid number of inputs")
    end

    // interpret the input parameters
    if (~ (isscalar (n) & (n == fix (n)) & (n > 0)))
        error ("besself: filter order N must be a positive integer");
    end

    stop = %F;
    digital = %F;
    for i = 1:length (varargin)
        select (varargin(i))
        case "s"
            digital = %F;
        case "z"
            digital = %T;
        case "high" 
            stop = %T;
        case "stop"
            stop = %T;
        case "low"
            stop = %F;
        case "pass"
            stop = %F;
        else
            error ("besself: expected [high|stop] or [s|z]");
        end
    end

    // FIXME: Band-pass and stop-band currently non-functional, remove
    //        this check once low-pass to band-pass transform is implemented.
    if (~ isscalar (w))
        error ("besself: band-pass and stop-band filters not yet implemented");
    end

    [rows_w colums_w] = size(w);

    if (~ ((length (w) <= 2) & (rows_w == 1 | columns_w == 1)))
        error ("besself: frequency must be given as WC or [WL, WH]");
    elseif ((length (w) == 2) & (w(2) <= w(1)))
        error ("besself: W(1) must be less than W(2)");
    end

    if (digital & ~ and ((w >= 0) & (w <= 1)))
        error ("besself: and elements of W must be in the range [0,1]");
    elseif (~ digital & ~ and (w >= 0))
        error ("besself: and elements of W must be in the range [0,inf]");
    end

    // Prewarp to the band edges to s plane
    if (digital)
        T = 2;       // sampling frequency of 2 Hz
        w = 2 / T * tan (%pi * w / T);
    end

    // Generate splane poles for the prototype Bessel filter
    [zero, pole, gain] = besselap (n);
    // splane frequency transform
    [zero, pole, gain] = sftrans (zero, pole, gain, w, stop);

    // Use bilinear transform to convert poles to the z plane
    if (digital)
        [zero, pole, gain] = bilinear (zero, pole, gain, T);
    end

    // convert to the correct output form
    if (nargout == 2)
        //    a = real (gain * poly (zero));
        //    b = real (poly (pole));
        [a b] = zp2tf(zero, pole, gain);
    elseif (nargout == 3)
        a = zero;
        b = pole;
        c = gain;
    else
        // output ss results
        //    [a, b, c, d] = zp2ss (zero, pole, gain);
        error("besself: yet not implemented in state-space form OR invalid number of o/p arguments")
    end
=======
function [a, b, c, d] = besself (n, w, varargin)
//This function generates a Bessel filter.
//Calling Sequence
//[a, b] = besself(n, w)
//[a, b] = besself (n, w, "high")
//[a, b, c] = besself (…)
//[a, b, c, d] = besself (…)
//[…] = besself (…, "z")
//Parameters 
//n: positive integer value
//w: positive real value
//Description
//This is an Octave function.
//This function generates a Bessel filter. The default is a Laplace space (s) filter.
//The third parameter takes in high or low, the default value being low. The cutoff is pi*Wc radians.
//[z,p,g] = besself(...) returns filter as zero-pole-gain rather than coefficients of the numerator and denominator polynomials.
//[...] = besself(...,’z’) returns a discrete space (Z) filter. w must be less than 1.
//[a,b,c,d] = besself(...) returns state-space matrices. 
//Examples
//[a,b]=besself(2,3,"low")
//a =  9.0000
//b =
//   1.0000   5.1962   9.0000

funcprot(0);
rhs = argn(2)
lhs = argn(1)
if(rhs<2 | rhs>4)
error("Wrong number of input arguments.")
end
if(lhs<2 | lhs>4)
error("Wrong number of output arguments.")
end


	select (rhs)
	case 2 then
		if (lhs==2) 	 [a,b] = callOctave("besself",n, w)
		elseif (lhs==3)  [a,b,c] = callOctave("besself",n, w)
		elseif (lhs==4)  [a,b,c,d] = callOctave("besself",n, w)
		end
	case 3 then
		if (lhs==2)	 [a,b] = callOctave("besself",n, w,varargin(1))
		elseif (lhs==3)  [a,b,c] = callOctave("besself",n, w,varargin(1))
		elseif (lhs==4)  [a,b,c,d] = callOctave("besself",n, w,varargin(1))
		end
	case 4 then
		if (lhs==2)      [a,b] = callOctave("besself",n, w,varargin(1),varargin(2))
		elseif (lhs==3)  [a,b,c] = callOctave("besself",n, w,varargin(1),varargin(2))
		elseif (lhs==4)  [a,b,c,d] = callOctave("besself",n, w,varargin(1),varargin(2))
		end
	end
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
endfunction
