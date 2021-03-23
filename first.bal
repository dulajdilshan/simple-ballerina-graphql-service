import ballerina/graphql;

// The `graphql:Service` exposes a GraphQL service on the provided port.
service graphql:Service /graphql on new graphql:Listener(9090) {

    resource function get greetMe(string name) returns string {
        return string `Hello, ${name}`;
    }
}
