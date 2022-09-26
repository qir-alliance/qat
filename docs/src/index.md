# QIR Adaptor Tool

Welcome to the QIR Adaptor Tool (QAT), a tool to transform a generic QIR into a QIR targeted to specific set of requirements. The goal of this framework is to create tools that allow quantum hardware vendors to adapt a generic QIR to their specific hardware requirements and restrictions.

Outline:

-   ( ) [Introduction](../../README.md)

-   ( ) [Quick start](QuickStart/index.md)

    -   (x) Supported systems
    -   ( ) Building with Bazel
    -   ( ) Building with CMake
    -   ( ) Running QAT

-   ( ) QIR and target QIRs

    -   ( ) Motivation
    -   ( ) Examples

-   ( ) QIR adaptor tool

    -   ( ) Based on the LLVM infrastructure
    -   ( ) Adapting and validating QIR
    -   ( ) Adaptors
    -   ( ) Configuration

-   ( ) Using QAT

    -   ( ) [Targeting a QIR](base-profile-transfomrations.md)
    -   ( ) [Debugging a QIR](UserGuide/DebuggingIR.md)
    -   ( ) [QAT: Assumptions and Restrictions](UserGuide/GoalsAndAssumptions.md)

-   ( ) Developer guide

    -   ( ) [Architecture Overview](DeveloperGuide/ArchitectureOverview.md)
    -   ( ) [Writing an adaptor](DeveloperGuide/WritingComponent.md)
    -   ( ) [Rule based adaptors](DeveloperGuide/WritingRuleTests.md)

-   ( ) Additional developer info:
    -   ( ) [Contributing](../../CONTRIBUTING.md)
    -   ( ) [Code quality](DeveloperGuide/CodeQuality.md)
    -   ( ) [Developer FAQ](DeveloperGuide/DeveloperFAQ.md)
