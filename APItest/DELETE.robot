*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
API pública
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com
    ${response}=    DELETE On Session    jsonplaceholder    /posts/1
    Log    ${response.status_code}