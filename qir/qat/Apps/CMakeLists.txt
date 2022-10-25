add_executable(qat Qat/Qat.cpp Qat/QatConfig.cpp Qat/QirAdaptorConfiguration.cpp)

target_link_libraries(qat ${llvm_libs})
target_link_libraries(qat 
    Logging 
    TargetQisMappingPass 
    Rules 
    AllocationManager 
    Commandline 
    AdaptorFactory 
    QirAdaptor 
    Validator 
    ValidationPass 
    StaticResourceComponent 
    GroupingPass 
    ModuleLoader 
    PostTransformValidation 
    RemoveNonEntrypointFunctions 
    ZExtTransformPass 
    DeferMeasurementPass
    FunctionReplacementPass
    Version
    yaml-cpp)



add_executable(version_tool VersionTool/VersionTool.cpp)
target_link_libraries(version_tool ${llvm_libs} yaml-cpp)
target_link_libraries(version_tool Version)
