var PotluckApp = angular.module("PotluckApp", ["ngResource", "ngRoute"]).
    config(function ($routeProvider) {
        $routeProvider.
            when('/', { controller: EventListDeleteCtrl, templateUrl: '/pages/eventList.html' }).
            when('/event/update', { controller: EventCreateCtrl, templateUrl: '/pages/eventEdit.html' }).
            when('/edit/:editId', { controller: EventEditCtrl, templateUrl: '/pages/eventEdit.html' }).
            when('/eventMenu/:eventId', { controller: EventMenuCtrl, templateUrl: '/pages/eventMenu.html' }).
            when('/eventMenu/:eventId/menuItem/create', { controller: MenuCreateCtrl, templateUrl: '/pages/menuEdit.html' }).
            when('/eventMenu/:eventId/supplyItem/create', { controller: SupplyCreateCtrl, templateUrl: '/pages/menuEdit.html' }).
            when('/eventMenu/:eventId/menuItem/:menuId/update', { controller: MenuEditCtrl, templateUrl: '/pages/menuEdit.html' }).
            when('/eventMenu/:eventId/supplyItem/:menuId/update', { controller: SupplyEditCtrl, templateUrl: '/pages/menuEdit.html' }).
            otherwise({ redirectTo: '/' });
    });

//var ListCtrl = function ($scope, $location) {
//    $scope.test = "testing";
//};

///////////////////////////////////////////////////////////////////////////////
//                          EVENT CONTROLLERS
///////////////////////////////////////////////////////////////////////////////
PotluckApp.factory('Event', function ($resource) {
    return $resource('/api/Event/:id', { id: '@id' }, { update: { method: 'PUT' } });
});

// Create event
var EventCreateCtrl = function ($scope, $location, Event) {
    $scope.action = "Add";
    $scope.save = function () {
        Event.save($scope.anEvent, function () {
            $location.path('/');
        });
    };
};

// Update event
var EventEditCtrl = function ($scope, $location, $routeParams, Event) {
    $scope.action = "Update";
    var id = $routeParams.editId;
    $scope.anEvent = Event.get({ id: id });

    $scope.save = function () {
        Event.update({ id: id }, $scope.anEvent, function () {
            $location.path('/');
        });
    };
}

// List events
// Delete event
var EventListDeleteCtrl = function ($scope, $location, Event) {
    $scope.events = Event.query();

    $scope.delete = function () {
        var id = this.event.eventId;
        Event.delete({ id: id }, function () {
            $("#event_" + id).fadeOut();
        });
    };
};

///////////////////////////////////////////////////////////////////////////////
//                          MENU CONTROLLERS
///////////////////////////////////////////////////////////////////////////////
PotluckApp.factory('Menu', function ($resource) {
    return $resource('/api/Menu/:id', { id: '@id' }, { update: { method: 'PUT' } });
});

// List menu/supply items for selected event
// Delete item from menu/supply list
var EventMenuCtrl = function ($scope, $location, $routeParams, Event, Menu) {
    var eId = $routeParams.eventId;
    Event.get({ id: eId }, function (response) {
        $scope.event = response;   
    });
    
    $scope.delete = function () {
        var mId = this.menu.menuId;
        Menu.delete({ id: mId }, function () {
            $("#menu_" + mId).fadeOut();
        });
    };
};

// Create menu item
var MenuCreateCtrl = function ($scope, $location, $routeParams, Event, Menu) {
    $scope.action = "Add item";
    $scope.menuOrSupply = " to the menu";

    var eId = $routeParams.eventId;
    $scope.event = Event.get({ id: eId });

    $scope.eventNumber = eId;   // for the "cancel" link, return this event

    $scope.save = function () {
        $scope.menu.Event_eventId = eId;
        Menu.save($scope.menu, function () {
            $location.path('/eventMenu/' + eId);
        });
    };
};

// Create supply list item
var SupplyCreateCtrl = function ($scope, $location, $routeParams, Event, Menu) {
    $scope.action = "Add item";
    $scope.menuOrSupply = " to the supply list";

    var eId = $routeParams.eventId;
    $scope.event = Event.get({ id: eId });

    $scope.eventNumber = eId;   // for the "cancel" link, return this event

    $scope.save = function () {
        $scope.menu.Event_eventId = eId;
        Menu.save($scope.menu, function () {
            $location.path('/eventMenu/' + eId);
        });
    };
};

// Update menu item
var MenuEditCtrl = function ($scope, $location, $routeParams, Event, Menu) {
    $scope.action = "Update item";
    $scope.menuOrSupply = " to the menu";
    
    var eId = $routeParams.eventId;
    var mId = $routeParams.menuId;
    $scope.menu = Menu.get({ id: mId });
    
    $scope.eventNumber = eId;   // for the "cancel" link, return this event

    $scope.save = function () {
        Menu.update({ id: mId }, $scope.menu, function () {
            $location.path('/eventMenu/' + eId);
        });
    };
}

// Update supply list item
var SupplyEditCtrl = function ($scope, $location, $routeParams, Event, Menu) {
    $scope.action = "Update item";
    $scope.menuOrSupply = " to the supply list";

    var eId = $routeParams.eventId;
    var mId = $routeParams.menuId;
    $scope.menu = Menu.get({ id: mId });

    $scope.eventNumber = eId;   // for the "cancel" link, return this event

    $scope.save = function () {
        Menu.update({ id: mId }, $scope.menu, function () {
            $location.path('/eventMenu/' + eId);
        });
    };
}