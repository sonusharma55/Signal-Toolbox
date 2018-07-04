function [z, p, g] = cheb2ap (n, Rs)
    //This function produces a lowpass analog Chebyshev type II prototype filter.

    //Calling Sequence
    //[z, p, g] = cheb2ap (n, Rs)

    //Parameters 
    //n: Filter Order
    //Rs: Stopband attenuation (in dB)
    //z: Zeros
    //p: Poles
    //g: Gain

    //Description
    //This function designs a lowpass analog Chebyshev type II filter of nth order and with a stopband attenuation of Rs.

    //Author :
    //Sonu Sharma
    //RGIT, Mumbai
    //Developed under FOSSEE Fellowship 2018, IIT Bombay

    //Examples
    //[z, p, g] = cheb2ap (4, 10)
    //Output :
    // g  =
    // 
    //    0.3162278  
    // p  =
    // 
    //  - 0.1674887 + 0.9498949i  
    //  - 1.1818323 + 1.1499912i  
    //  - 1.1818323 - 1.1499912i  
    //  - 0.1674887 - 0.9498949i  
    // z  =
    // 
    //  - 1.0823922i  
    //  - 2.6131259i  
    //    2.6131259i  
    //    1.0823922i 


    funcprot(0);
    lhs = argn(1)
    rhs = argn(2)
    if (rhs < 2 | rhs > 2)
        error("cheb2ap: Wrong number of input arguments.")
    end

    Rsf = 10 ^ (-Rs/20);    //stop band pick to pick ripple in fraction
    rs = Rsf ;             //analpf function compitable stop band ripple (delta-s)
    [hs,p,z,g]=analpf(n,"cheb2",[0 rs],1); //cutoff frequency of 1 rad/sec for prototype filter
    p = p' ;
    z = z' ;
    g = abs(g);
endfunction
