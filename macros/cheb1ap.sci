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

    //Author :
    //Sonu Sharma
    //RGIT, Mumbai
    //Developed under FOSSEE Fellowship 2018, IIT Bombay

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

endfunction
