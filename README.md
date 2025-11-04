# PA7: Type Checker

## Overview

This assignment explores static type checking in programming languages. You'll work with TYPE1, a statically-typed language that includes type annotations, type inference, and comprehensive type error detection. You'll add type annotations to programs, analyze type expressions, and create examples demonstrating various type errors.

## Repository Structure

```
pa7/
├── TYPE1/          # Statically-typed language implementation
│   ├── grammar     # TYPE1 grammar specification
│   ├── program     # Program to type-annotate (Q1)
│   └── samples     # Sample TYPE1 programs
└── ASSIGNMENT.md   # Detailed assignment instructions
```

## Quick Start

### Using GitHub Codespaces

1. Click the green "Code" button above
2. Select "Codespaces" tab
3. Click "Create codespace on main"
4. Wait for the environment to build (first time takes ~2-3 minutes)
5. The terminal will open with PLCC ready to use

### Using VS Code DevContainers

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
2. Install [VS Code](https://code.visualstudio.com/)
3. Install the "Dev Containers" extension in VS Code
4. Clone this repository locally
5. Open in VS Code and click "Reopen in Container" when prompted
6. The environment will build with PLCC installed

## Assignment Tasks

1. **Q1**: Add type annotations to a program using higher-order procedures
2. **Q2**: Analyze and determine the type of a complex let expression
3. **Q3**: Identify type errors in a given expression
4. **Q4**: Create minimal examples demonstrating each type error category

See `ASSIGNMENT.md` for complete instructions and requirements.

## Submission

**To Submit:**

1. Complete all questions, including written answers in ASSIGNMENT.md
2. Test your TYPE1 program to ensure it works correctly
3. From inside your container: `tar -czf /workspace/pa7-YOURNAME.zip /workspace`
4. Download and submit the zip file to Kodiak

**Grading Criteria:**

- **Submission (33.3%):** Files are properly named and located as specified
- **Completeness (33.3%):** All questions attempted (incomplete = incorrect)
- **Correctness (33.3%):** Solutions demonstrate understanding of type systems

**Late Policy:** 10% per day, maximum 5 days late

Good luck with your assignment!

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
