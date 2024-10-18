#include "isim/work/tb___d_a_t_a_p_a_t_h__v/tb___d_a_t_a_p_a_t_h__v.h"
#include "isim/work/glbl/glbl.h"
static const char * HSimCopyRightNotice = "Copyright 2004-2005, Xilinx Inc. All rights reserved.";


#include "work/tb___d_a_t_a_p_a_t_h__v/tb___d_a_t_a_p_a_t_h__v.h"
static HSim__s6* IF0(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    HSim__s6 *blk = new workMtb___d_a_t_a_p_a_t_h__v(label); 
    return blk;
}


#include "work/_r_e_g___f_i_l_e/_r_e_g___f_i_l_e.h"
static HSim__s6* IF1(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    HSim__s6 *blk = new workM_r_e_g___f_i_l_e(label); 
    return blk;
}


#include "work/_a_l_u/_a_l_u.h"
static HSim__s6* IF2(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    HSim__s6 *blk = new workM_a_l_u(label); 
    return blk;
}


#include "work/_d_a_t_a_p_a_t_h/_d_a_t_a_p_a_t_h.h"
static HSim__s6* IF3(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    HSim__s6 *blk = new workM_d_a_t_a_p_a_t_h(label); 
    return blk;
}


#include "work/glbl/glbl.h"
static HSim__s6* IF4(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    HSim__s6 *blk = new workMglbl(label); 
    return blk;
}

class _top : public HSim__s6 {
public:
    _top() : HSim__s6(false, "_top", "_top", 0, 0, HSim::VerilogModule) {}
    HSimConfigDecl * topModuleInstantiate() {
        HSimConfigDecl * cfgvh = 0;
        cfgvh = new HSimConfigDecl("default");
        (*cfgvh).addVlogModule("tb_DATAPATH_v", (HSimInstFactoryPtr)IF0);
        (*cfgvh).addVlogModule("REG_FILE", (HSimInstFactoryPtr)IF1);
        (*cfgvh).addVlogModule("ALU", (HSimInstFactoryPtr)IF2);
        (*cfgvh).addVlogModule("DATAPATH", (HSimInstFactoryPtr)IF3);
        (*cfgvh).addVlogModule("glbl", (HSimInstFactoryPtr)IF4);
        HSim__s5 * topvl = 0;
        topvl = new workMtb___d_a_t_a_p_a_t_h__v("tb_DATAPATH_v");
        topvl->moduleInstantiate(cfgvh);
        addChild(topvl);
        topvl = new workMglbl("glbl");
        topvl->moduleInstantiate(cfgvh);
        addChild(topvl);
        return cfgvh;
}
};

main(int argc, char **argv) {
  HSimDesign::initDesign();
  globalKernel->getOptions(argc,argv);
  HSim__s6 * _top_i = 0;
  try {
    HSimConfigDecl *cfg;
 _top_i = new _top();
  cfg =  _top_i->topModuleInstantiate();
    return globalKernel->runTcl(cfg, _top_i, "_top", argc, argv);
  }
  catch (HSimError& msg){
    try {
      globalKernel->error(msg.ErrMsg);
      return 1;
    }
    catch(...) {}
      return 1;
  }
  catch (...){
    globalKernel->fatalError();
    return 1;
  }
}
