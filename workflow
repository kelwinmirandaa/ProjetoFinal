name: ProjetoFinal

on:
  push:
    branches:
      - main
  workflow_dispatch:

env:
  app-name: projetofinal

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2

    - name: Set up Node.js version
      uses: actions/setup-node@v1
      with:
        node-version: '14.x'

    - name: npm install, build, and test
      run: |
        npm install
        npm run build --if-present
        npm run test --if-present
    - name: Upload artifact for deployment job
      uses: actions/upload-artifact@v2
      with:
        name: node-app
        path: .    
  
  jobs:
  build:
    name: TEST
    runs-on: ubuntu-latest
    
    
  deploy-to-hom:
    runs-on: ubuntu-latest
    environment:
      name: 'HOM'
      url: ${{ steps.deploy-to-webapp.outputs.webapp-url }}

  deploy-to-production:
    runs-on: ubuntu-latest
    needs: deploy-to-hom
    environment:
      name: 'production'
      url: ${{ steps.deploy-to-webapp.outputs.webapp-url }}
