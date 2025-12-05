% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Sweta Chandra Mohan 
%
% Documentation: 

%https://athena.ecs.csus.edu/~mei/logicp/prolog/programming-examples.html

%used the above site to reminde myself of PROLOG syntax and examples 

%saw a couple of logic puzzle examples from here 
%https://peerdh.com/blogs/programming-insights/beginner-prolog-projects-for-logic-puzzles
%https://www.swi-prolog.org/pldoc/man?predicate=format%2f2 saw some text formatting here but didnt really use it but helped me print 



% The query to get the answer(s) or that there is no answer
% ?- solve.




% the whos!
cadet(smith).
cadet(chen).
cadet(garcia).
cadet(jones).

% the whens
day(tue).
day(wed).
day(thu).
day(fri).

% the whats!
object(weather_balloon).
object(kite).
object(cloud).
object(fighter_aircraft).

solve :-
    %sssigning cadets
    cadet(TC), cadet(WC), cadet(ThC), cadet(FC),
    TC \= WC, TC \= ThC, TC \= FC,
    WC \= ThC, WC \= FC,
    ThC \= FC, %here i am showing that all of the cadets are different 
    %because it cant be one cadet for multiple days

    % here I am creating the objects and making sure no one object is spoted twice 
    object(TO), object(WO), object(ThO), object(FO),
    TO \= WO, TO \= ThO, TO \= FO,
    WO \= ThO, WO \= FO,
    ThO \= FO,

    %rules from the project description: 

    % smith didnt see a weather balloon or a kite
    (TC \= smith ; (TO \= weather_balloon, TO \= kite)), % either the cadet on tues is not smith or if it is smith
    %then the object he saw was not a weather balloon or kite
    (WC \= smith ; (WO \= weather_balloon, WO \= kite)),
    (ThC \= smith ; (ThO \= weather_balloon, ThO \= kite)),
    (FC \= smith ; (FO \= weather_balloon, FO \= kite)),

    % The one who saw the kite was not Garcia
    (TC \= garcia ; TO \= kite),%either tuesday cadet is not garcia 
    (WC \= garcia ; WO \= kite),
    (ThC \= garcia ; ThO \= kite),
    (FC \= garcia ; FO \= kite),

    %friday is chen or the person who saw the fighter 
    (FC = chen ; FO = fighter_aircraft),

    %there was no kite seen tuesday
    TO \= kite,

    % garcia and jones both did not see the weather balloon
    
    
    (TC \= garcia ; TO \= weather_balloon),
    (TC \= jones  ; TO \= weather_balloon),
    (WC \= garcia ; WO \= weather_balloon),
    (WC \= jones  ; WO \= weather_balloon),
    (ThC \= garcia ; ThO \= weather_balloon),
    (ThC \= jones  ; ThO \= weather_balloon),
    (FC \= garcia ; FO \= weather_balloon),
    (FC \= jones  ; FO \= weather_balloon),

    % Jones was not the tues cadet
    TC \= jones,

    %  smith  saw a cloud
    (TC \= smith ; TO = cloud), %either tuesday was not smith spotting an object or tuesday's object is a cloud
    (WC \= smith ; WO = cloud),
    (ThC \= smith ; ThO = cloud),
    (FC \= smith ; FO = cloud),

    % fighter aircraft was spotted on fri
    FO = fighter_aircraft,

    % weather balloon was not spotted on wed
    WO \= weather_balloon,

    %here I am printing the results 

    nl,
    nl,
    
    write('Tue: '), write(TC), write(' saw '), write(TO), nl,
    write('Wed: '), write(WC), write(' saw '), write(WO), nl,
    write('Thurs: '), write(ThC), write(' saw '), write(ThO), nl,
    write('Fri: '), write(FC), write(' saw '), write(FO), nl.
    
    
    
