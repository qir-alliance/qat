# QIR Adaptor Tool

Welcome to the QIR Adaptor Tool (QAT), a tool to transform a generic QIR into a
QIR targeted to specific set of requirements. The goal of this framework is to
create tools that allow quantum hardware vendors to adapt a generic QIR to their
specific hardware requirements and restrictions.

Outline:

- ( ) [Introduction](../../README.md)

- (v) [Quick start](QuickStart/index.md)

  - (v) Supported systems
  - (v) Building with Bazel
  - (v) Building with CMake
  - (v) Running QAT

- (x) Using QAT

  - (x) [Targeting a QIR](UsingQAT/TargetingQIR.md)
  - (x) [Debugging a QIR](UsingQAT/DebuggingIR.md)
  - (x) [QAT: Assumptions and Restrictions](UsingQAT/GoalsAndAssumptions.md)

- (x) Developer guide

  - (x) [Architecture Overview](DeveloperGuide/ArchitectureOverview.md)
  - (x) [Writing an adaptor](DeveloperGuide/WritingComponent.md)
  - (x) [Rule based adaptors](DeveloperGuide/WritingRuleTests.md)
  - (x) [Circuit separation](DeveloperGuide/LogicSeparation.md)

- (x) Additional developer info:
  - (x) [Contributing](../../CONTRIBUTING.md)
  - (x) [Code quality](DeveloperGuide/CodeQuality.md)
  - (x) [Developer FAQ](DeveloperGuide/DeveloperFAQ.md)
