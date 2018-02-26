class('Vehicle').
class('EnginePoweredVehicle').
class('HumanPoweredVehicle').
class('Car').
class('Bus').
class('Bicycle').
inherits('EnginePoweredVehicle','Vehicle').
inherits('HumanPoweredVehicle','Vehicle').
inherits('Car','EnginePoweredVehicle').
inherits('Bus','EnginePoweredVehicle').
inherits('Bicycle','HumanPoweredVehicle').
memberVariable('numberOfSeats',protected,int,'Vehicle').
memberVariable('engineCapacity',public,int,'EnginePoweredVehicle').
memberVariable('fuelConsumption',protected,float,'EnginePoweredVehicle').
memberVariable('nameOfOwner',private,'java.lang.String','Car').
memberVariable('nameOfOwnerCompany',private,'java.lang.String','Bus').
memberVariable('numberOfGears',public,int,'Bicycle').
brother(X,Y) :- inherits(X,Z),inherits(Y,Z),not(X=Y).
ancestor(X,Y) :- inherits(X,Y);inherits(X,Z),ancestor(Z,Y).
descendant(X,Y) :- ancestor(Y,X).
containsPublicMemberVariables(X) :- memberVariable(_,public,_,X).


