import ballerina/graphql;

type Person record {|
    string name;
    int age;
    School school;
|};

type School record {
    string name;
    string address;
};

service graphql:Service /graphql on new graphql:Listener(9090) {

    resource function get greetMe(string name) returns string {
        return string `Hello, ${name}`;
    }

    resource function get getPerson() returns Person[]{
        School royalCollege = { name: "Royal College", address: "Colombo"};
        School anandaCollege = { name: "Royal College", address: "Colombo"};
        School trinityCollege = { name: "Triity College", address: "Kandy"};

        Person personDulaj = {name: "Dulaj", age: 26, school: royalCollege};
        Person personDilshan = {name: "Dilshan", age: 25, school: anandaCollege};
        Person personBalasuriya = {name: "Balasuriya", age: 27, school: trinityCollege};

        Person[] persons = [personDulaj, personDilshan, personBalasuriya];

        return persons;
    }
}
