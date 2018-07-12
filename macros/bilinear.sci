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

function [Zz, Zp, Zg] = bilinear(Sz, Sp, Sg, T)
    
        //Transforms a s-plane filter (Analog) into a z-plane filter (Digital) using Bilinear transformation

    //Calling Sequence
    // [Zb, Za] = bilinear(Sb, Sa, T)
    // [Zb, Zb] = bilinear(Sz, Sp, Sg, T)
    // [Zz, Zp, Zg] = bilinear(...)

    //Prameters
    //Sb: Numerator coefficient vector in s-domain
    //Sa: denumerator coefficient vector s-domain
    //Sz: zeros in s-plane
    //Sp: poles in s-plane
    //Sg: gain in s-domain
    //T: Sampling period (double)
    //Zb: Numerator coefficient vector in z-domain
    //Za: denumerator coefficient vector z-domain
    //Zz: zeros in z-plane
    //Zp: poles in z-plane
    //Zg: gain in z-domain

    //Description:
    //a filter design can be transformed from the s-plane to the z-plane while maintaining the band edges by means of the bilinear transform. This maps the left hand side of the s-plane into the interior of the unit circle in z-plane. The mapping is highly non-linear, so you must design your filter with band edges in the s-plane positioned at 2/T tan(w*T/2) so that they will be positioned at w after the bilinear transform is complete.
    //It does following transformation from s-plane to z-plane
    //                      2  z-1                     
    //             s -> -  ----                    
    //                      T  z+1                    

    //Examples
    //[z p g] = bilinear ([1 2 3], [4 5 6], 1, 1)
    //Output :
    //  Number of zeros at infinity =    
    // 
    //    1.  
    // g  =
    // 
    //  - 0.1666667  
    // p  =
    // 
    //  - 3.  - 2.3333333  - 2.  
    // z  =
    // 
    //  - 5.    3.  

    funcprot(0);
    [nargout nargin] = argn();
    ieee(1);

    if nargin==3
        T = Sg;
        [Sz, Sp, Sg] = tf2zp(Sz, Sp);
    elseif nargin~=4
        error("bilinear: invalid number of inputs")
    end

    p = length(Sp);
    z = length(Sz);
    if z > p | p==0
        error("bilinear: must have at least as many poles as zeros in s-plane");
    end

    // ----------------  -------------------------  ------------------------
    // Bilinear          zero: (2+xT)/(2-xT)        pole: (2+xT)/(2-xT)
    //      2 z-1        pole: -1                   zero: -1
    // S -> - ---        gain: (2-xT)/T             gain: (2-xT)/T
    //      T z+1
    // ----------------  -------------------------  ------------------------
    Zg = real(Sg * prod((2-Sz*T)/T) / prod((2-Sp*T)/T));
    
    if Zg == 0 & nargout == 3 then
            error("bilinear: invalid value of gain due to zero(s) at infinity avoid z-p-g form and use tf form ")
    end
    
    Zp = (2+Sp*T)./(2-Sp*T);
    if isempty(Sz)
        Zz = -ones(size(Zp));
    else
        Zz = [(2+Sz*T)./(2-Sz*T)];
        Zz = postpad(Zz, p, -1);
    end

    if nargout==2
        // zero at infinity
        Zz1 = [];
        for i=1:length(Zz)
            if Zz(i) ~= %inf
                Zz1 = [Zz1 Zz(i)];
            end
        end
        Zz = Zz1;
        
        if Zg == 0
            z = %z;
            bi = (2*(z - 1))/(T*(z + 1));
            Hs = Sg * real(poly(Sz, "s"))/real(poly(Sp, "s"));
            Hz = horner(Hs, bi);
            b = coeff(Hz.num);
            a = coeff(Hz.den);
            Zg = b($)/a($);
        end
       
        [Zz, Zp] = zp2tf(Zz, Zp, Zg);
        Zz = prepad(Zz, length(Zp));
    end

endfunction
=======
function [Zb, Za, Zg]= bilinear(Sb,varargin)
// Transform a s-plane filter specification into a z-plane specification
//Calling Sequence
// [ZB, ZA] = bilinear (SB, SA, T)
// [ZB, ZA] = bilinear (SZ, SP, SG, T)
// [ZZ, ZP, ZG] = bilinear (...)
//Description
//Transform a s-plane filter specification into a z-plane specification.  Filters can be specified in either zero-pole-gain or transfer function form.  The input form does not have to match the output form.  1/T is the sampling frequency represented in the z plane.
//
//Note: this differs from the bilinear function in the signal processing toolbox, which uses 1/T rather than T.
//
//Theory: Given a piecewise flat filter design, you can transform it from the s-plane to the z-plane while maintaining the band edges by means of the bilinear transform. This maps the left hand side of the s-plane into the interior of the unit circle. The mapping is highly non-linear, so you must design your filter with band edges in the s-plane positioned at 2/T tan(w*T/2) so that they will be positioned at w after the bilinear transform is complete.
//Examples
//[ZB,ZA]=bilinear([1],[2,3],3)
	funcprot(0);
	lhs= argn(1);
	rhs= argn(2);
	if(rhs < 3 | rhs > 4)
		error("Wrong number of input arguments");
	end
	if(lhs < 2 | lhs > 3)
		error("Wrong number of output arguments");
	end
	select(rhs)
	case 3 then
		select(lhs)
		case 2 then
			[Zb, Za]= callOctave("bilinear", Sb, varargin(1), varargin(2));
		case 3 then
			[Zb, Za, Zg]= callOctave("bilinear", Sb, varargin(1), varargin(2));
		end
	case 4 then
		select(lhs)
		case 2 then
			[Zb, Za]= callOctave("bilinear", Sb, varargin(1), varargin(2), varargin(3));
		case 3 then
			[Zb, Za, Zg]= callOctave("bilinear", Sb, varargin(1), varargin(2), varargin(3));
		end
	end
endfunction		
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
