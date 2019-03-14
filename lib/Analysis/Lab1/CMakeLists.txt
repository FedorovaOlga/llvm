add_llvm_library( LLVMLab1 MODULE BUILDTREE_ONLY
  BranchInstCount.cpp

 DEPENDS
  intrinsics_gen
  PLUGIN_TOOL
  opt
  )