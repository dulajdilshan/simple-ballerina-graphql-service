import ballerina/graphql;

const OPEN = "OPEN";
const CLOSED = "OPEN";
const HOLD = "OPEN";

type Lift record {|
    string id;
    string name;
    string status;
    int capacity;
    boolean night;
    int elevationGain;
|};

type Trail record {|
    string id;
    string name;
    string status;
    string difficulty;
    boolean groomed;
    boolean night;
    Lift[] accessByLifts;
|};

type Subscription record {|
    Lift liftStatusChange;
    Trail trailStatusChange;
|};

Lift lift1 = {
    id: "a",
    name: "aa",
    status: OPEN,
    capacity: 2,
    night: false,
    elevationGain: 5
};
Lift lift2 = {
    id: "b",
    name: "bb",
    status: CLOSED,
    capacity: 1,
    night: true,
    elevationGain: 3
};
Lift lift3 = {
    id: "c",
    name: "cc",
    status: HOLD,
    capacity: 3,
    night: false,
    elevationGain: 7
};

Lift[] lifts = [lift1, lift2, lift3];

Trail trail1 = {
    id: "trail_1",
    name: "trail_1",
    status: OPEN,
    difficulty: "beginner",
    groomed: false,
    night: true,
    accessByLifts: [lift1, lift2]
};

Trail trail2 = {
    id: "trail_2",
    name: "trail_2",
    status: OPEN,
    difficulty: "intermediate",
    groomed: true,
    night: false,
    accessByLifts: [lift1, lift3]
};

Trail trail3 = {
    id: "trail_3",
    name: "trail_3",
    status: OPEN,
    difficulty: "advanced",
    groomed: true,
    night: true,
    accessByLifts: [lift2, lift3]
};

Trail[] trails = [trail1, trail2, trail2];

service graphql:Service / on new graphql:Listener(9000) {
    resource function get allLifts() returns Lift[] {
        return lifts;
    }

    resource function get allTrails() returns Trail[] {
        return trails;
    }

    resource function get lift(string id) returns Lift|(){
        foreach var lift in lifts {
            if lift.id == id {
                return lift;
            }
        }
        return ();
    }

    resource function get trail(string id) returns Trail|(){
        foreach var trail in trails {
            if trail.id == id {
                return trail;
            }
        }
        return ();
    }

    resource function get trailCount () returns int{
        return trails.length();
    }

    resource function get liftCount () returns int{
        return lifts.length();
    }
}
