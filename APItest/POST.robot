*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
API pública
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    title=foo    body=bar    userId=1
    ${response}=    POST On Session    jsonplaceholder    /posts    json=${body}    headers=${headers}
    Log    ${response.json()}