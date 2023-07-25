# QIR Adaptor Tool

Welcome to the QIR Adaptor Tool (QAT), a tool to transform a generic QIR into a
QIR targeted to specific set of requirements. The goal of this framework is to
create tools that allow quantum hardware vendors to adapt a generic QIR to their
specific hardware requirements and restrictions.

Outline:

- [Introduction](#introduction)
- [Quick start](QuickStart/index.md)
    - [Supported systems](QuickStart/index.md#supported-systems)
    - [Building with Bazel](QuickStart/building-with-bazel.md)
    - [Building with CMake](QuickStart/building-with-cmake.md)
    - [Running QAT](QuickStart/running-qat.md)
- Using QAT
    - [Targeting a QIR](UsingQAT/TargetingQIR.md)
    - [Debugging a QIR](UsingQAT/DebuggingIR.md)
    - [QAT: Assumptions and Restrictions](UsingQAT/GoalsAndAssumptions.md)
- Developer guide
    - [Architecture Overview](DeveloperGuide/ArchitectureOverview.md)
    - [Writing an adaptor](DeveloperGuide/WritingAdaptor.md)
    - [Rule based adaptors](DeveloperGuide/WritingRuleTests.md)
    - [Grouping QIS](DeveloperGuide/LogicSeparation.md)
- Additional developer info:
    - [Contributing](../../CONTRIBUTING.md)
    - [Code quality](DeveloperGuide/CodeQuality.md)
    - [Developer FAQ](DeveloperGuide/DeveloperFAQ.md)

## Introduction

The QIR adapter tool (QAT) is a tool that is intended to transform a generic QIR
to a QIR targeted to a specific backend and validate that it is compliant with
the backend requirements. A QIR target describes a subset of the generic QIR
functionality and conventions. It is anticipated that most usages of the QIR
specification will need to only use a subset of it. These subsets may further be
subject to constraints such as how one allocate or acquire a qubit handle. We
refer to such a subset with constraints as a target. For instance, it is likely
that early versions of quantum backend will have a limited set of classical
instructions available. With this in mind, the vendor or user of said backend
would define a profile that only contains a specified subset. A target consists
of a set of classical capabililties referred to as a profile and a quantum
instruction set (QIS). One example of such a target is the base profile with any
QIS, which only allows function calls and jumps, but no arithmetic, classical
memory, or classical data types.

The generation of the generic QIR according to the spec with no constraints
would typically be performed by the frontend. A couple of examples are Q# or
OpenQASM 3.0. However, for the generated QIR to be practical it is necessary to
reduce it using a profile which is compatible with the target platform:

```text
┌──────────────────────┐
│       Frontend       │
└──────────────────────┘
           │
           │ QIR
           ▼
┌──────────────────────┐
│  QIR Adaptor Tool    │ <─────── Targeting the QIR
└──────────────────────┘
           │
           │ Adapted QIR
           ▼
┌──────────────────────┐
│       Backend        │
└──────────────────────┘
```

As an example, a backend based quantum platform may only have support for
sequential gates with no branching or ability for subroutines. Likewise, some
quantum platforms only allow for a single measurement at the end of executing
the pipeline of quantum gates. Profiles suppose to express these nuances and
restrictions which are absent in the generic QIR.
