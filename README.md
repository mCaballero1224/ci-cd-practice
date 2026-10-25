# CI/CD for a Simple C Program

## What is CI/CD?

CI/CD is short for Continuous Integration & Continuous Deployment: a means of software development that makes use of automation during the process of building, testing, and releasing code. The goal of CI/CD is to make this process faster and more reliable.

### Continuous Integration

Continuous Integration is the first part of the process where new code is integrated into the repository. This is where building, testing and merging occurs. Developers are prone to make mistakes: typos, mistakes in syntax, etc. So, it's important to catch these mistakes before they make it to production. Thus, flagging errors during the build process and ensuring tests are passed *before* merging are critical.

### Continuous Deployment

In Continuous Deployment is responsible for releasing the code filtered by the CI step to a release version. In this repository, the result of this is are simple binaries. However, for something like a web-based service, this can involve deploying changes directly to a server automatically for users to enjoy. 

## Details on CI/CD Setup

The CI/CD setup in this repository is done through GitHub Actions. For testing, the `tests` directory contains unit tests that are used to validate the pushed code. The following is a brief overview of the pipeline:

### CI

Whenever code is pushed to the main branch, a series of steps are taken.

1. Checkout Code: the code for a commit is checked out
2. Install Build Essentials and Tools: tools such ask cmake and valgrind are installed for compiling and testing
3. Run Static Analysis: cppcheck is used for linting to check for any formatting errors
4. Compile Code: make is used to compile the code for the app
5. Run Tests: the test build is compiled and unit tests are executed
6. Memory Analysis: valgrind is used to check for memory leaks using the test build

### CD

This process only occurs when tags with version numbers such as v0.0.1 are pushed.

1. Checkout Code
2. Install Build Essentials
3. Build Production Binaries
4. Rename Binaries: since two compilers (gcc, clang) are used, two binaries are produced and must be named appropriately
5. Upload Binaries: binaries are pushed to the "Releases" page for the repository

## Conclusion

While the program used in this setup is rather simple, this CI/CD setup can be expanded upon for more complex projects. Having a skeleton to work off of will be quite useful in the future for me, and I hope that others can make use of this setup if they also find it helpful. In the immediate future, I plan to use this for an [NES emulator](https://github.com/mCaballero1224/nes_emulator) project.
