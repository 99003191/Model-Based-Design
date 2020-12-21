building = 'dC_to_dF';
new_system(building)
open_system(building) 

x = 40;
y = 40;
w = 40;
h = 40;
offset = 100;

pos = [x y x+w y+h*.75];
add_block('simulink/Commonly Used Blocks/Constant', 'dC_to_dF/Celsius','Position',pos);
set_param('dC_to_dF/Celsius','value','34');

pos = [(x+offset) y (x+offset)+w y+h];
add_block('simulink/Math Operations/Gain', 'dC_to_dF/Gain','Position',pos);
set_param('dC_to_dF/Gain','Gain','9/5');

add_line('dC_to_dF','Celsius/1','Gain/1')

pos = [(x+2*offset) y (x+2*offset)+w y+h];
add_block('simulink/Math Operations/Add', 'dC_to_dF/Add','Position',pos);

add_line('dC_to_dF','Gain/1','Add/1')

pos = [(x+offset) (y+offset) (x+offset)+w (y+offset)+h*.75];
add_block('simulink/Commonly Used Blocks/Constant', 'dC_to_dF/Constant1','Position',pos);
set_param('dC_to_dF/Constant1','value','32');

add_line('dC_to_dF','Constant1/1','Add/2')

pos = [(x+3*offset) (y) (x+offset*3)+w y+h*.75];
add_block('simulink/Sinks/Display', 'dC_to_dF/Fahrenheit','Position',pos);
set_param('dC_to_dF/Constant1','value','32');

add_line('dC_to_dF','Add/1','Fahrenheit/1')


%%Loading the system 'Autofetch_n_Replace'
%load_system('dC_to_dF');

% getting the parameter value of the constant 'Celsius'
get_param('dC_to_dF/Celsius','Value');

% setting the parameter value of the constant 'Celsius' to 10
set_param('dC_to_dF/Celsius','Value','10');

% verifying the constant value of 'Celsius'
get_param('dC_to_dF/Celsius','Value');

%defining a for loop for auto-feeding the input values from 0 to 273
for m = 0:273
    set_param('dC_to_dF/Celsius','Value','m');
end

