%% Falsification Problems

%% Initialization
BrDemo.InitAFC();
B = BrAFC.copy();

InputGen = fixed_cp_signal_gen({'Pedal_Angle','Engine_Speed'}, [3 1]);
B.SetInputGen(InputGen);
B.SetParamRanges({'Pedal_Angle_u1', 'Pedal_Angle_u2', 'Pedal_Angle_u3'}, [ 0 50]);
B.SetParamRanges({'Engine_Speed_u0','Engine_Speed_u1'}, [ 900 1100]);
STL_ReadFile('AFC_simple_spec.stl');

%% 
phi005= set_params(AF_alw_ok, 'tol', 0.005);
AFC_falsif005 = FalsificationProblem(B, phi005);

%% 
phi05= set_params(AF_alw_ok, 'tol', 0.05);
AFC_falsif05 = FalsificationProblem(B, phi05);

%% 
phi01= set_params(AF_alw_ok, 'tol', 0.01);
AFC_falsif01 = FalsificationProblem(B, phi01);
