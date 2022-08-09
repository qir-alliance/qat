add_executable(qat Qat/Qat.cpp Qat/QatConfig.cpp Qat/ProfileConfiguration.cpp)

target_link_libraries(qat ${llvm_libs})
target_link_libraries(qat 
    Logging 
    TransformationRulesPass 
    Rules 
    AllocationManager 
    Commandline 
    Generators 
    Profile 
    Validator 
    ValidationPass 
    StaticResourceComponent 
    GroupingPass 
    ModuleLoader 
    PostTransformValidation 
    PreTransformTrimming 
    ZExtTransformPass 
    OneShotMeasurementPass 
    Version)



add_executable(version_tool VersionTool/VersionTool.cpp)
target_link_libraries(version_tool ${llvm_libs})
target_link_libraries(version_tool Version)
