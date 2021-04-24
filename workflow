name: Projeto

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  job1:
    runs-on: ubuntu-latest
    name: BUILD
    steps:
    - run: date
  job2:
    runs-on: windows-latest
    name: TEST
    steps:
    - run: date
