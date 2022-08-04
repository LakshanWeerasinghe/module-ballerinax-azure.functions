import ballerina/test;
import ballerina/io;
import ballerina/http;

@test:Config { }
function testDefault() returns error? {
   final http:Client clientEndpoint = check new ("http://localhost:3000");
   string jsonFilePath = "./tests/resources/default.json";
   json readJson = check io:fileReadJson(jsonFilePath);
   json resp = check clientEndpoint->post("/default-hello-all", readJson);
   json expectedResp = {"Outputs":{"resp":{"body":"Hello from all"}},"Logs":[],"ReturnValue":null};
   test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testBaseDot() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/base-dot.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "Hello from . path "}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function httpResTest1() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/httpResTest1.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-httpResTest1", readJson);
    json expectedResp = {
        "Outputs": {
            "resp": {
                "statusCode": "401",
                "body": "Helloworld.....",
                "headers": {"Location": "/myServer/084230", "content-type": "application/account+json"}
            }
        },
        "Logs": [],
        "ReturnValue": null
    };
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function httpResTest2() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/httpResTest2.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-httpResTest2", readJson);
    json expectedResp = {
        "Outputs": {
            "resp": {
                "statusCode": "200",
                "body": "Helloworld.....",
                "headers": {"content-type": "text/plain"}
            }
        },
        "Logs": [],
        "ReturnValue": null
    };
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function httpResTest3() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/httpResTest3.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-httpResTest3", readJson);
    json expectedResp = {
        "Outputs": {
            "resp": {
                "statusCode": "500",
                "body": "Helloworld.....",
                "headers": {"content-type": "application/json+id", "Location": "/myServer/084230"}
            }
        },
        "Logs": [],
        "ReturnValue": null
    };
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function httpResTest4() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/httpResTest4.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-httpResTest4", readJson);
    json expectedResp = {
        "Outputs": {
            "resp": {
                "statusCode": "500",
                "headers": {"content-type": "text/plain"}
            }
        },
        "Logs": [],
        "ReturnValue": null
    };
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testSimpleResourcePath() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/res-path.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-foo", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "Hello from foo path Jack"}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config { }
function testSimpleMultiResourcePath() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/res-path-param.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-foo-bar-2", readJson);
    json expectedResp = {"Outputs":{"resp":{"body":"Hello from foo bar res"}},"Logs":[],"ReturnValue":null};
    test:assertEquals(resp, expectedResp);
}

@test:Config { }
function testSimpleConflictingPathParam() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/res-path-conflict-param.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-foo-bar-1", readJson);
    json expectedResp = {"Outputs":{"resp":{"body":"Hello from foo param meow"}},"Logs":[],"ReturnValue":null};
    test:assertEquals(resp, expectedResp);
}


@test:Config {}
function testSimpleMultiQueryPath() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/query-param.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-query", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "Hello from the query Jack test1"}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testSimpleQueue() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/queue-string.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/queue", readJson);
    json expectedResp = {"Outputs": {"outMsg": "helloo aaaaa"}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testCosmosInputArr() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/cosmos-db-arr.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-db", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "Hello Jackhello1"}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testJsonJsonPayload() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/payload-json-json.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-payload-jsonToJson", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "Hello from json to json Anjana"}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testJsonRecordPayload() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/payload-json-record.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-payload-jsonToRecord", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "Hello from json to record Anjana"}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testXmlPayload() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/payload-xml-xml.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-payload-xmlToXml", readJson);
    string xmlPayload = "\"<root>\\n  <name>Anjana<\\/name>\\n  <age>12<\\/age>\\n<\\/root>\"";
    json expectedResp = {"Outputs": {"resp": {"body": xmlPayload}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testTextStringPayload() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/payload-text-string.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-payload-textToString", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "hello from byte\n"}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testTextBytePayload() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/payload-text-byte.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-payload-textToByte", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "hello from byte\n"}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testOctaBytePayload() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/payload-octa-byte.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/post-hello-payload-octaToByte", readJson);
    json expectedResp = {"Outputs": {"resp": {"body": "hello from byte arr\n"}}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testCosmosTrigger() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/trigger-cosmos-base.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/cosmos", readJson);
    json expectedResp = {"Outputs": {"outMsg": "helloo ehee"}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testTimerTrigger() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/timer.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/timer", readJson);
    json expectedResp = {"Outputs": {"outMsg": "helloo false"}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}

@test:Config {}
function testQueueInput() returns error? {
    final http:Client clientEndpoint = check new ("http://localhost:3000");
    string jsonFilePath = "./tests/resources/queue-input.json";
    json readJson = check io:fileReadJson(jsonFilePath);
    json resp = check clientEndpoint->post("/queue-input", readJson);
    json expectedResp = {"Outputs": {"outMsg": "helloo qqeeewwww hello1"}, "Logs": [], "ReturnValue": null};
    test:assertEquals(resp, expectedResp);
}
