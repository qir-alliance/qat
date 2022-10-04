# QIR Adaptor Tool

Welcome to the QIR Adaptor Tool (QAT), a tool to transform a generic QIR into a QIR targeted to specific set of requirements. The goal of this framework is to create tools that allow quantum hardware vendors to adapt a generic QIR to their specific hardware requirements and restrictions.

Outline:

- ( ) [Introduction](../../README.md)

- ( ) [Quick start](QuickStart/index.md)

  - (x) Supported systems
  - (x) Building with Bazel
  - (x) Building with CMake
  - (-) Running QAT

- ( ) Using QAT

  - ( ) [Targeting a QIR](TargetingQIR.md)
  - (x) [Debugging a QIR](UsingQAT/DebuggingIR.md)
  - (x) [QAT: Assumptions and Restrictions](UsingQAT/GoalsAndAssumptions.md)

- ( ) QIR adaptor tool

  - ( ) Based on the LLVM infrastructure
  - ( ) Adapting and validating QIR
  - ( ) Adaptors
  - ( ) Configuration

- (x) Developer guide

  - (x) [Architecture Overview](DeveloperGuide/ArchitectureOverview.md)
  - (x) [Writing an adaptor](DeveloperGuide/WritingComponent.md)
  - (x) [Rule based adaptors](DeveloperGuide/WritingRuleTests.md)
  - (x) [Circuit separation](DeveloperGuide/LogicSeparation.md)

- (x) Additional developer info:
  - (x) [Contributing](../../CONTRIBUTING.md)
  - (x) [Code quality](DeveloperGuide/CodeQuality.md)
  - (x) [Developer FAQ](DeveloperGuide/DeveloperFAQ.md)
