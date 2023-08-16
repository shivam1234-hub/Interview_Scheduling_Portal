
function nextNextIndex=getTimeSlot()

% Define the time slots

timeSlots = {'9:00-9:30', '9:30-10:00', '10:00-10:30', '10:30-11:00', '11:00-11:30', ...
             '11:30-12:00', '12:00-12:30', '12:30-1:00', '1:00-1:30', '1:30-2:00', ...
             '2:00-2:30', '2:30-3:00', '3:00-3:30', '3:30-4:00', '4:00-4:30', ...
             '4:30-5:00', '5:00-5:30', '5:30-6:00'};

% Get the current time
currentTime = clock;
currentHour = 9;
currentMinute = 28;

% Calculate the current time in minutes
currentTimeInMinutes = currentHour * 60 + currentMinute;

% Calculate the index of the current time slot
currentIndex = floor((currentTimeInMinutes - 9 * 60) / 30) + 1;
if currentIndex < 1
    currentIndex = 1;
elseif currentIndex > numel(timeSlots)
    currentIndex = numel(timeSlots);
end

% Calculate the index of the next-to-next time slot
nextNextIndex = mod(currentIndex + 2, numel(timeSlots));
if nextNextIndex == 0
    nextNextIndex = numel(timeSlots);
end

% Display the index of the next-to-next time slot
disp(nextNextIndex);

end
