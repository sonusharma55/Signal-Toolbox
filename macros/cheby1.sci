function [a, b, c, d] = cheby1 (n, rp, w, varargin)
<<<<<<< HEAD
    //Chebyshev type I filter design with rp dB of passband ripple.

    //Calling Sequence
    //[b, a] = cheby1 (n, rp, w)
    //[b, a] = cheby1 (n, rp, w, "high")
    //[b, a] = cheby1 (n, rp, [wl, wh])
    //[b, a] = cheby1 (n, rp, [wl, wh], "stop")
    //[z, p, g] = cheby1 (…)
    //[…] = cheby1 (…, "s")

    //Parameters 
    //n: positive integer value (order of filter)
    //rp: non negative scalar value (passband ripple)
    //w: positive real value, 
    //    1).Normalised digital cutoff frequency/frequencies for digital filter, in the range [0, 1] {dimensionless}
    //    2).Analog cutoff frequency/frequencies for analog filter, in the range [0, Inf] {rad/sec}

    //Description
    //This function generates a Chebyshev type I filter with rp dB of passband ripple.
    //if second parameter is scalar the fourth parameter takes in high or low, default value is low. The cutoff is pi*Wc radians.
    //[b, a] = cheby1(n, Rp, [Wl, Wh]) indicates a band pass filter with edges pi*Wl and pi*Wh radians.
    //[b, a] = cheby1(n, Rp, [Wl, Wh], ’stop’) indicates a band reject filter with edges pi*Wl and pi*Wh radians.
    //[z, p, g] = cheby1(...) returns filter as zero-pole-gain rather than coefficients of the numerator and denominator polynomials.
    //[...] = cheby1(...,’s’) returns a Laplace space filter, w can be larger than 1 rad/sec.

    //Examples
    //[z, p, k]=cheby1(2,6,0.7,"high")
    //a =
    //   1   1
    //b =
    //  -0.62915 + 0.55372i  -0.62915 - 0.55372i
    //c =  0.055649

    funcprot(0);
    [nargout nargin] = argn();

    if (nargin > 5 | nargin < 3 | nargout > 4 | nargout < 2)
        error("cheby1: invalid number of inputs");
    end

    // interpret the input parameters
    if (~ (isscalar (n) & (n == fix (n)) & (n > 0)))
        error ("cheby1: filter order N must be a positive integer");
    end

    stop = %F;
    digital = %T;
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
            stop = %T;
        case "pass"
            stop = %F;
        else
            error ("cheby1: expected [high|stop] or [s|z]");
        end
    end
    
    [rows_w columns_w] = size(w);

    if (~ ((length (w) <= 2) & (rows_w == 1 | columns_w == 1)))
        error ("cheby1: frequency must be given as WC or [WL, WH]");
    elseif ((length (w) == 2) & (w(2) <= w(1)))
        error ("cheby1: W(1) must be less than W(2)");
    end

    if (digital & ~ and ((w >= 0) & (w <= 1)))
        error ("cheby1: all elements of W must be in the range [0,1]");
    elseif (~ digital & ~ and (w >= 0))
        error ("cheby1: all elements of W must be in the range [0,inf]");
    end

    if (~ (isscalar (rp) & or(type (rp) == [1 5 8]) & (rp >= 0)))
        error ("cheby1: passband ripple RP must be a non-negative scalar");
    end

    // Prewarp to the band edges to s plane
    if (digital)
        T = 2;       // sampling frequency of 2 Hz
        w = 2 / T * tan (%pi * w / T);
    end

    // Generate splane poles and zeros for the Chebyshev type 1 filter
    C = 1;  // default cutoff frequency
    epsilon = sqrt (10^(rp / 10) - 1);
    v0 = asinh (1 / epsilon) / n;
    pole = exp (1*%i * %pi * [-(n - 1):2:(n - 1)] / (2 * n));
    pole = -sinh (v0) * real (pole) + 1*%i * cosh (v0) * imag (pole);
    zero = [];
    


    // compensate for amplitude at s=0
    gain = prod (-pole);
    // if n is even, the ripple starts low, but if n is odd the ripple
    // starts high. We must adjust the s=0 amplitude to compensate.
    if (modulo (n, 2) == 0)
        gain = gain / 10^(rp / 20);
    end
    

    // splane frequency transform
    [zero, pole, gain] = sftrans (zero, pole, gain, w, stop);
    

    // Use bilinear transform to convert poles to the z plane
    if (digital)
        [zero, pole, gain] = bilinear (zero, pole, gain, T);
    end
    
    // convert to the correct output form
    if (nargout == 2)
        [a b] = zp2tf(zero, pole, gain);
    elseif (nargout == 3)
        a = zero;
        b = pole;
        c = gain;
    else
        // output ss results
        //        [a, b, c, d] = zp2ss (zero, pole, gain);
        error("cheby1: yet not implemented in state-space form OR invalid number of o/p arguments")
    end

=======
//This function generates a Chebyshev type I filter with rp dB of passband ripple.
//Calling Sequence
//[a, b] = cheby1 (n, rp, w)
//[a, b] = cheby1 (n, rp, w, "high")
//[a, b] = cheby1 (n, rp, [wl, wh])
//[a, b] = cheby1 (n, rp, [wl, wh], "stop")
//[a, b, c] = cheby1 (…)
//[a, b, c, d] = cheby1 (…)
//[…] = cheby1 (…, "s")
//Parameters 
//n: positive integer value
//rp: non negative scalar value
//w: vector, all elements must be in the range [0,1]
//Description
//This is an Octave function.
//This function generates a Chebyshev type I filter with rp dB of passband ripple.
//The fourth parameter takes in high or low, default value is low. The cutoff is pi*Wc radians.
//[b, a] = cheby1(n, Rp, [Wl, Wh]) indicates a band pass filter with edges pi*Wl and pi*Wh radians.
//[b, a] = cheby1(n, Rp, [Wl, Wh], ’stop’) indicates a band reject filter with edges pi*Wl and pi*Wh radians.
//[z, p, g] = cheby1(...) returns filter as zero-pole-gain rather than coefficients of the numerator and denominator polynomials.
//[...] = cheby1(...,’s’) returns a Laplace space filter, w can be larger than 1.
//[a,b,c,d] = cheby1(...) returns state-space matrices.
//Examples
//[a,b,c]=cheby1(2,6,0.7,"high")
//a =
//   1   1
//b =
//  -0.62915 + 0.55372i  -0.62915 - 0.55372i
//c =  0.055649

rhs = argn(2)
lhs = argn(1)
[rows,columns] = size(w)
if(rhs>5 | rhs<3)
error("Wrong number of input arguments.")
end
if(lhs>4 | lhs<2)
error("Wrong number of output arguments.")
end

	select (rhs)
	case 3 then
		if (lhs==2) 	 [a,b] = callOctave("cheby1",n, rp, w)
		elseif (lhs==3)  [a,b,c] = callOctave("cheby1",n, rp, w)
		elseif (lhs==4)  [a,b,c,d] = callOctave("cheby1",n, rp, w)
		end
	case 4 then
		if (lhs==2) 	 [a,b] = callOctave("cheby1",n, rp, w, varargin(1))
		elseif (lhs==3)  [a,b,c] = callOctave("cheby1",n, rp, w, varargin(1))
		elseif (lhs==4)  [a,b,c,d] = callOctave("cheby1",n, rp, w, varargin(1))
		end
	case 5 then
		if (lhs==2) 	 [a,b] = callOctave("cheby1",n, rp, rs, w, varargin(1), varargin(2))
		elseif (lhs==3)  [a,b,c] = callOctave("cheby1",n, rp, rs, w, varargin(1), varargin(2))
		elseif (lhs==4)  [a,b,c,d] = callOctave("cheby1",n, rp, rs, w, varargin(1), varargin(2))
		end
	end
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
endfunction
