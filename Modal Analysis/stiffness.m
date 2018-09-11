classdef stiffness
    methods (Static)
        function out = stiff(l, e, i)
            out = (3 * e * i)/(l^3);
           
        end
    end
end