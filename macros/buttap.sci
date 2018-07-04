function [z, p, g] = buttap (n)
    //Produces analog prototype filter

    //Calling Sequence

    //[z, p, g] = buttap (n)

    //Parameters 
    //n: Filter Order
    //z: Zeros
    //p: Poles
    //g: Gain

    //Description
    //It gives a lowpass analog prototype Butterworth filter of nth order.

    //Author :
    //Sonu Sharma
    //RGIT, Mumbai
    //Developed under FOSSEE Fellowship 2018, IIT Bombay

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

endfunction
