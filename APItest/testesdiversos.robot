*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
GET - Buscar post por ID
    Create Session    jsonplaceholder    ${BASE_URL}
    ${response}=    GET On Session    jsonplaceholder    /posts/1
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    title

POST - Criar novo post
    Create Session    jsonplaceholder    ${BASE_URL}
    ${body}=    Create Dictionary    title=Teste Novo Post    body=Corpo do post    userId=1
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST On Session    jsonplaceholder    /posts    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    201
    Dictionary Should Contain Key    ${response.json()}    id

PUT - Atualizar post existente
    Create Session    jsonplaceholder    ${BASE_URL}
    ${body}=    Create Dictionary    id=1    title=Atualizado    body=Texto atualizado    userId=1
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    PUT On Session    jsonplaceholder    /posts/1    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()['title']}    Atualizado

DELETE - Remover post
    Create Session    jsonplaceholder    ${BASE_URL}
    ${response}=    DELETE On Session    jsonplaceholder    /posts/1
    Should Be Equal As Integers    ${response.status_code}    200
