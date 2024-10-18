////////////////////////////////////////////////////////////////////////////////
//   ____  ____  
//  /   /\/   /  
// /___/  \  /   
// \   \   \/    
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /___/   /\   
// \   \  /  \  
//  \___\/\___\ 
////////////////////////////////////////////////////////////////////////////////

#ifndef H_workMtb___d_a_t_a_p_a_t_h__v_H
#define H_workMtb___d_a_t_a_p_a_t_h__v_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workMtb___d_a_t_a_p_a_t_h__v : public HSim__s5{
public: 
    workMtb___d_a_t_a_p_a_t_h__v(const char *instname);
    ~workMtb___d_a_t_a_p_a_t_h__v();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim__s1 us[1];
    HSim__s3 uv[7];
};

#endif
