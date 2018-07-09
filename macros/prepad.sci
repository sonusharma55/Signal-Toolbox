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

// This is a supporting function

function y = prepad(x, n, varargin)
    if argn(2) > 3 | argn(2) < 2  then
        error("prepad : wrong number of input argument ")
    elseif argn(2) == 2
        c = 0 ;
    else
        c = varargin(1);
    end
    
    y = x;
    for i = 1:(n-length(x))
        y = [c y];
    end
endfunction
