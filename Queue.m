classdef Queue < handle

    properties

        data % Data array to store the elements of the queue

    end

    

    methods

        function obj = Queue()

            % Constructor to initialize the queue

            obj.data = {};

        end

        

        function push(obj, element)

            % Pushes an element to the rear of the queue

            obj.data = [obj.data, element];

        end

        

        function element = pop(obj)

            % Pops and returns the front element from the queue

            if isempty(obj.data)

                error('Queue is empty!');

            end

            

            element = obj.data{1};

            obj.data = obj.data(2:end);

        end

        

        function empty = isEmpty(obj)

            % Checks if the queue is empty

            empty = isempty(obj.data);

        end

        

        function queueSize = size(obj)

            % Returns the size of the queue

            queueSize = numel(obj.data);

        end

         function topElement = top(obj)

            % Returns the front element of the queue without removing it

            if isempty(obj.data)

                error('Queue is empty!');

            end

            

            topElement = obj.data{1};

        end

    end

end