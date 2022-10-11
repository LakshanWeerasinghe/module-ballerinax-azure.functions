import ballerinax/azure_functions as af;
import ballerina/http;

listener af:HttpListener ep = new ();

public type Person record {|
    readonly int id;
|};

public annotation Person Pp on parameter;

public type DBEntry record {
    string id;
};

type RateLimitHeaders record {|
    string x\-rate\-limit\-id;
    int? x\-rate\-limit\-remaining;
    string[]? x\-rate\-limit\-types;
|};

type TestRecord record {|
    string[]|string xRate;
|};

type NestedRecord record {|
    RateLimitHeaders xRate;
|};

service "hello" on ep {

    resource function get allowedHeaderRecord(@http:Header string|() clientKey) returns string|() {

        return clientKey;
    }

    resource function get unallowedAnnot(@Pp {id: 0} string a) returns string {

        return a;
    }

    resource function get allowedAfAnnot(@af:CosmosDBInput {
                                  connectionStringSetting: "CosmosDBConnection",
                                  databaseName: "db1",
                                  collectionName: "c2",
                                  sqlQuery: "SELECT * FROM Items"
                              } DBEntry[] input1) returns string {

        return "Alpha";
    }

    resource function get headerString(@http:Header {name: "x-type"} string abc) returns string {
        return "done";
    }

    resource function get headerStringArr(@http:Header {name: "x-type"} string[] abc) returns string {
        return "done";
    }

    resource function get headerStringNil(@http:Header {name: "x-type"} string? abc) returns string {
        return "done";
    }

    resource function get headerStringArrNil(@http:Header {name: "x-type"} string[]? abc) returns string {
        return "done";
    }

    resource function get headerRecord(@http:Header {name: "x-type"} RateLimitHeaders abc) returns string {
        return "done";
    }

    resource function get headerRecordReadonly(@http:Header readonly & RateLimitHeaders abc) returns string {
        return "done";
    }

    resource function get headerRecordWithInvalidFieldUnion(@http:Header TestRecord abc) returns string {
        return "done"; 
    }

    resource function get headerRecordNil(@http:Header {name: "x-type"} RateLimitHeaders? abc) returns string {
        return "done";
    }

    resource function get headerRecordArr(@http:Header {name: "x-type"} RateLimitHeaders[] abc) returns string {
        return "done"; 
    }

    resource function get headerRecordArrNil(@http:Header RateLimitHeaders[]? abc) returns string {
        return "done"; 
    }

    resource function get headerRecordUnionStr(@http:Header RateLimitHeaders|string abc) returns string {
        return "done"; 
    }

    resource function get headerInlineRecord(@http:Header record {|string hello;|} abc) returns string {
        return "done";
    }

    resource function get headerInlineRestAndStringRecord(@http:Header record {|string hello;string...; |} abc) returns
    string {
        return "done"; 
    }

    resource function get headerInlineRestRecord(@http:Header record {|string...; |} abc) returns string {
        return "done"; 
    }

    resource function get headerInt(@http:Header int foo, @http:Header int[] bar, @http:Header int? baz,
            @http:Header int[]? daz, @http:Header readonly & int dawz) returns string {
        return "done";
    }

    resource function get headerDecimal(@http:Header decimal foo, @http:Header decimal[] bar, @http:Header decimal? baz,
            @http:Header decimal[]? daz, @http:Header readonly & decimal? dawz) returns string {
        return "done";
    }

    resource function get headerFloat(@http:Header float foo, @http:Header float[] bar, @http:Header float? baz,
            @http:Header float[]? daz, @http:Header readonly & float dawz) returns string {
        return "done";
    }

    resource function get headerBool(@http:Header boolean foo, @http:Header boolean[] bar, @http:Header boolean? baz,
            @http:Header boolean[]? daz, @http:Header readonly & boolean dawz) returns string {
        return "done";
    }

    resource function get headerErr1(@http:Header {name: "x-type"} json abc) returns string {
        return "done"; 
    }

    resource function post headerErr2(@http:Header @http:Payload string abc) returns string {
        return "done"; 
    }

    resource function get headerErr3(@http:Header {name: "x-type"} http:Request abc) returns string {
        return "done"; 
    }

    resource function get headerErr4(@http:Header {name: "x-type"} string|json abc) returns string {
        return "done"; 
    }

    resource function get headerErr5(@http:Header {name: "x-type"} json? abc) returns string {
        return "done"; 
    }

    resource function get headerErr6(@http:Header {name: "x-type"} string|json|xml abc) returns string {
        return "done"; 
    }

    resource function get headerErr7(@http:Header {name: "x-type"} int[] abc) returns string {
        return "done"; 
    }

    resource function get headerRecordWithRecordField(@http:Header NestedRecord abc) returns string {
        return "done"; 
    }

}
