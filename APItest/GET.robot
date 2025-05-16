*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Consulta GET em API pública
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com
    ${response}=    GET On Session    jsonplaceholder    /posts/1
    Log    ${response.json()}