*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
API pública
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    id=1    title=updated    body=updated body    userId=1
    ${response}=    PUT On Session    jsonplaceholder    /posts/1    json=${body}    headers=${headers}
    Log    ${response.json()}