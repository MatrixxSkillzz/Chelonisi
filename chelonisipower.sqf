/*
	"ChelonisiPower" static mission for Altis.
	Created by eraser1
	Credits to "Darth Rogue" for creating the base.
	mission rework on 7/12/2020 by Crito
*/

private ["_AICount1", "_AICount2", "_AICount3", "_AICount4", "_AICount5", "_AICount6", "_AICount7", "_armedVehiclechance", "_tankChance", "_ReinforcementTeamChance", "_ReinforcementTeam", "_groupReinforcementsInfo", "_AItrigger",  "_staticguns", "_missionObjs", "_crate0", "_crate1", "_crate_loot_values0", "_crate_loot_values1", "_crate_weapons0", "_crate_weapons1", "_crate_items0", "_crate_items1", "_crate_backpacks0", "_crate_backpacks1", "_difficultyM", "_difficulty", "_PossibleDifficulty", "_cash0", "_cash1", "_msgWIN"];

// For logging purposes
_num = DMS_MissionCount;

// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [16722,13552.9,0]; //insert the centre here

if ([_pos,DMS_StaticMinPlayerDistance] call DMS_fnc_IsPlayerNearby) exitWith {"delay"};

//create possible difficulty add more of one difficulty to weight it towards that
_PossibleDifficulty		= 	[	
								"easy",
								"moderate",
								"moderate",
								"difficult",
								"difficult",
								"difficult",
								"hardcore",
								"hardcore",
								"hardcore",
								"hardcore"
							];
//choose mission difficulty and set value and is also marker colour
_difficultyM = selectRandom _PossibleDifficulty;

switch (_difficultyM) do
{
	case "easy":
	{
		_difficulty = "easy";									//AI difficulty
		_AICount1 = (1 + (round (random 4)));					
		_AICount2 = (1 + (round (random 4)));
		_AICount3 = (1 + (round (random 4)));
		_AICount4 = (5 + (round (random 3)));
		_AICount5 = (5 + (round (random 3)));
		_AICount6 = (2 + (round (random 4)));
		_AICount7 = (1 + (round (random 4)));
		_armedVehiclechance = 0;
		_tankChance	= 0;	
		_AItrigger = (2 + (round (random 0)));					//If AI numbers fall below this number then reinforce if any left from AIMax
		_cash0 = (3000 + round (random (4500)));				//this gives 3000 to 7500 cash
		_cash1 = (3000 + round (random (4500)));				//this gives 3000 to 7500 cash
		_crate_weapons0 	= (30 + (round (random 10)));
		_crate_items0 		= (20 + (round (random 5)));
		_crate_backpacks0 	= (2 + (round (random 1)));
		_crate_weapons1 	= (10 + (round (random 2)));
		_crate_items1 		= (40 + (round (random 10)));
		_crate_backpacks1 	= (10 + (round (random 2)));
	};
	case "moderate":
	{
		_difficulty = "moderate";
		_AICount1 = (1 + (round (random 5)));					
		_AICount2 = (1 + (round (random 5)));
		_AICount3 = (1 + (round (random 5)));
		_AICount4 = (5 + (round (random 5)));
		_AICount5 = (5 + (round (random 5)));
		_AICount6 = (2 + (round (random 4)));	
		_AICount7 = (1 + (round (random 5)));
		_armedVehiclechance = 25;
		_tankChance	= 0;
		_AItrigger = (2 + (round (random 0)));
		_cash0 = (5500 + round (random (7000)));					//this gives 5500 to 12500 cash	
		_cash1 = (5500 + round (random (7000)));					//this gives 5500 to 12500 cash	
		_crate_weapons0 	= (30 + (round (random 10)));
		_crate_items0 		= (20 + (round (random 5)));
		_crate_backpacks0 	= (2 + (round (random 1)));
		_crate_weapons1 	= (10 + (round (random 2)));
		_crate_items1 		= (40 + (round (random 10)));
		_crate_backpacks1 	= (10 + (round (random 2)));
	};
	case "difficult":
	{
		_difficulty = "difficult";
		_AICount1 = (1 + (round (random 6)));					
		_AICount2 = (1 + (round (random 6)));
		_AICount3 = (1 + (round (random 6)));
		_AICount4 = (5 + (round (random 7)));
		_AICount5 = (5 + (round (random 7)));
		_AICount6 = (2 + (round (random 4)));
		_AICount7 = (1 + (round (random 6)));
		_armedVehiclechance = 50;
		_tankChance	= 25;	
		_AItrigger = (2 + (round (random 0)));
		_cash0 = (10000 + round (random (20000)));					//this gives 10000 to 30000 cash
		_cash1 = (10000 + round (random (20000)));					//this gives 10000 to 30000 cash
		_crate_weapons0 	= (30 + (round (random 10)));
		_crate_items0 		= (20 + (round (random 5)));
		_crate_backpacks0 	= (2 + (round (random 1)));
		_crate_weapons1 	= (10 + (round (random 2)));
		_crate_items1 		= (40 + (round (random 10)));
		_crate_backpacks1 	= (10 + (round (random 2)));
	};
	//case "hardcore":
	default
	{
		_difficulty = "hardcore";
		_AICount1 = (1 + (round (random 9)));					
		_AICount2 = (1 + (round (random 9)));
		_AICount3 = (1 + (round (random 9)));
		_AICount4 = (5 + (round (random 10)));
		_AICount5 = (5 + (round (random 10)));
		_AICount6 = (2 + (round (random 4)));
		_AICount7 = (1 + (round (random 9)));
		_armedVehiclechance = 100;
		_tankChance	= 100;
		_AItrigger = (2 + (round (random 0)));
		_cash0 = (15000 + round (random (35000)));					//this gives 1000 to 2500 cash
		_cash1 = (15000 + round (random (35000)));					//this gives 1000 to 2500 cash
		_crate_weapons0 	= (30 + (round (random 10)));
		_crate_items0 		= (60 + (round (random 5)));
		_crate_backpacks0 	= (6 + (round (random 1)));
		_crate_weapons1 	= (20 + (round (random 2)));
		_crate_items1 		= (60 + (round (random 10)));
		_crate_backpacks1 	= (10 + (round (random 2)));
	};
};

// Define spawn locations for AI Soldiers. These will be used for the initial spawning of AI as well as reinforcements.
_AISoldierSpawnLocations1 =
					[
						[16799.5,13573.6,0]
					];

	_group1 =
				[
					_AISoldierSpawnLocations1,
					_AICount1,
					_difficulty,
					"random",
					_side
				] call DMS_fnc_SpawnAIGroup_MultiPos;

_AISoldierSpawnLocations2 =
					[
						[16799.5,13573.6,0]
					];

	_group2 =
				[
					_AISoldierSpawnLocations2,
					_AICount2,
					_difficulty,
					"random",
					_side
				] call DMS_fnc_SpawnAIGroup_MultiPos;
			
_AISoldierSpawnLocations3 =
					[
						[16799.5,13573.6,0]
					];

	_group3 =
				[
					_AISoldierSpawnLocations3,
					_AICount3,
					_difficulty,
					"random",
					_side
				] call DMS_fnc_SpawnAIGroup_MultiPos;
				
_AISoldierSpawnLocations7 =
					[
						[16799.5,13573.6,0]
					];

	_group7 =
				[
					_AISoldierSpawnLocations7,
					_AICount7,
					_difficulty,
					"random",
					_side
				] call DMS_fnc_SpawnAIGroup_MultiPos;
				

_AISniperLocations1 =
					[
						[16593,13421,16.5315],
						[16688.7,13386,15.1512],
						[16690.2,13383.9,13.0346],
						[16724.8,13409.1,22.3314],
						[16697.1,13654.9,21.9754],
						[16722.3,13654.6,24.0685],
						[16766.7,13595.2,6.85435],
						[16720.4,13552.4,24.0203],
						[16707.7,13552.4,2.78171],
						[16721,13566.2,2.78099],
						[16717.2,13537.9,2.7769],
						[16731.8,13545.3,2.78491],
						[16856,13599.4,6.48216],
						[16871.2,13600.8,30.413],
						[16855.5,13689.8,19.2649],
						[16853.5,13693.5,18.9266] 
					];
	_AISniperLocations1 = _AISniperLocations1 call ExileClient_util_array_shuffle;
	
_StaticAssaultLocations1 = 
					[
						[16842.9,13576.4,2.11565],
						[16834.7,13561.6,12.5395],
						[16817.5,13549.1,11.1794],
						[16766.7,13595.2,6.85435],
						[16856,13599.4,6.48216],
						[16869.8,13597.9,4.525],
						[16847.9,13565.1,2.80024],
						[16706.5,13421.7,5.36613],
						[16716.5,13431.3,6.04612],
						[16715.7,13399.6,9.24479],
						[16693,13383.9,7.98038],
						[16682.8,13441.1,0.000267506],
						[16675.9,13449.9,6.24657e-005],
						[16685.5,13456.7,-2.28882e-005],
						[16697.1,13453.1,7.00951e-005],
						[16666.8,13380.1,7.62165],
						[16651.8,13383.3,9.48202],
						[16611.1,13402.8,10.2326],
						[16679.6,13653.7,1.77696],
						[16696.7,13671,2.4789],
						[16715.1,13685.7,4.66728],
						[16727.3,13670.9,3.11738],
						[16737.1,13655.8,3.17373],
						[16734.3,13644,1.99072],
						[16757.8,13655.7,-5.72205e-006],
						[16765.3,13662.6,-9.53674e-007],
						[16720,13548.2,-3.14713e-005],
						[16719.5,13556.8,8.58307e-006],
						[16725.1,13552,-2.95639e-005],
						[16715,13551.5,6.67572e-006],
						[16585.1,13654.2,0.242397],
						[16601.4,13644.4,0.383037],
						[16595.9,13628.2,7.39098e-005],
						[16584.8,13601.1,4.33922e-005],
						[16574.4,13597,1.71661e-005],
						[16579.6,13619.6,-1.23978e-005],
						[16567.5,13608.8,9.87053e-005],
						[16562.6,13621.5,-3.48091e-005],
						[16574.1,13632.5,-0.000204563],
						[16573.3,13609.3,3.48091e-005],
						[16559.2,13641.7,1.09876],
						[16549,13638.9,0.559917],
						[16539.7,13651,2.7534],
						[16557.7,13663.6,2.7688],
						[16565.1,13652.8,0.700804],
						[16556.6,13648.8,1.20397],
						[16543.4,13660,2.91877],
						[16811.3,13566.3,-3.19481e-005],
						[16819.4,13575.3,-0.000103951],
						[16799.1,13543.8,3.00814],
						[16823.1,13546.1,1.23801],
						[16827.7,13541.4,1.58399],
						[16814.6,13540,3.36435],
						[16798.9,13535.1,1.0315],
						[16799.9,13533.2,1.79633],
						[16797.6,13533.6,0.985641],
						[16802.2,13535.9,1.57025],
						[16618.5,13415.4,4.69651],
						[16654.8,13402.2,3.11881],
						[16674.9,13398.5,4.33628],
						[16699.8,13412.7,4.75331],
						[16711,13429.6,5.45922],
						[16639,13495.5,0],
						[16668,13501.2,-0.547585],
						[16705.1,13512.7,0.183017],
						[16693.6,13485,-0.0679026],
						[16652.8,13459.9,-0.151915],
						[16871.2,13600.8,30.413]

					];
	_StaticAssaultLocations1 = _StaticAssaultLocations1 call ExileClient_util_array_shuffle;
/*	
_StaticAssaultLocations2 = 
					[
						[23384.4,18752.2,0.592812],
						[23367.7,18759.7,0.601673],
						[23371.9,18761.3,0.601673],
						[23367,18765.9,0.601673],
						[23370.4,18760.6,3.12652],
						[23365.9,18765.7,3.12652],
						[23381.5,18779.3,0.592812],
						[23355.6,18780.9,0.692609],
						[23349.8,18765.5,0.592812],
						[23312.3,18719.8,0.541],
						[23325.7,18720,0.541],
						[23333.6,18719.9,0.541],
						[23334.6,18725.9,0.541],
						[23326.2,18725.9,0.541],
						[23317.9,18725.9,0.541],
						[23310.6,18725.8,0.541],
						[23327.6,18722.9,0.541],
						[23311.8,18722.9,0.541],
						[23313.5,18723,3.88764],
						[23327.4,18722.9,3.88764],
						[23316.8,18719.6,3.88702],
						[23333.9,18725.9,3.88764],
						[23333.7,18720.3,3.88764],
						[23327.6,18720.2,3.88764],
						[23329,18726.1,3.88764],
						[23319.3,18725.8,3.88764],
						[23311.6,18726,3.88764],
						[23312,18720,3.88764],
						[23321.7,18723,0],
						[23353.9,18720.3,0.541],
						[23361.3,18718.8,0.54083],
						[23370.2,18719.9,0.541],
						[23377.1,18719.8,0.541],
						[23377.6,18726.1,0.541],
						[23370.1,18726.1,0.541],
						[23362.4,18726.1,0.541],
						[23354,18726.2,0.540999],
						[23354,18723.1,0.541],
						[23368.8,18723.1,0.541],
						[23374.2,18723.2,3.88764],
						[23376.7,18725.9,3.88764],
						[23369.6,18726,3.88764],
						[23361.7,18726.1,3.88764],
						[23354.3,18726.1,3.88764],
						[23355,18720.1,3.88764],
						[23360.4,18718.8,3.8872],
						[23370.6,18719.9,3.88764],
						[23376.8,18720,3.88764],
						[23355.1,18722.9,3.88764],
						[23419.3,18726.1,3.88764],
						[23413.2,18726,3.88764],
						[23404.6,18726.1,3.88764],
						[23397.7,18726.1,3.88764],
						[23397.5,18720.1,3.88764],
						[23402.9,18718.4,3.88743],
						[23413.7,18720.1,3.88764],
						[23419.9,18720.3,3.88764],
						[23415.8,18723.2,3.88764],
						[23398.1,18723,3.88764],
						[23397,18723.2,0.541],
						[23397.3,18720,0.541],
						[23404.3,18718.7,0.540816],
						[23413.3,18720,0.541],
						[23419.4,18720.1,0.541],
						[23419.8,18725.8,0.541],
						[23413.1,18726,0.541],
						[23405.6,18726,0.541],
						[23397.5,18726.1,0.541],
						[23419.9,18682.3,3.88764],
						[23399.3,18682.1,3.88764],
						[23398.2,18679.4,3.88764],
						[23403.8,18678.5,3.88711],
						[23414.1,18679.3,3.88764],
						[23420.8,18679.3,3.88764],
						[23420.9,18685,3.88764],
						[23414.6,18685.3,3.88764],
						[23406.9,18685.4,3.88764],
						[23397.8,18685.4,3.88764],
						[23398.4,18685.4,0.541],
						[23405,18685.3,0.541],
						[23413.3,18685.1,0.541],
						[23420.6,18685.1,0.541],
						[23420.4,18679.3,0.541],
						[23413.1,18679.5,0.541],
						[23404.8,18677.6,0.540797],
						[23398,18679.4,0.541],
						[23398.6,18682.2,0.541],
						[23415.3,18682.2,0.541],
						[23375.7,18680.1,0.541],
						[23369.2,18680.3,0.541],
						[23360.3,18678.3,0.540817],
						[23353.6,18680.1,0.541],
						[23333.1,18680.3,0.541],
						[23326.3,18679.9,0.541],
						[23317.9,18678.1,0.5408],
						[23310.5,18679.9,0.541],
						[23311.4,18685.7,0.541],
						[23318.4,18685.7,0.541],
						[23327.2,18685.9,0.541],
						[23333.7,18685.6,0.541],
						[23353.2,18685.6,0.541],
						[23361.8,18685.7,0.541],
						[23369.4,18685.8,0.541],
						[23376.8,18685.8,0.541],
						[23376,18686,3.88764],
						[23368.6,18685.7,3.88764],
						[23360.8,18685.6,3.88764],
						[23353.6,18685.6,3.88764],
						[23332.5,18685.3,3.88764],
						[23326.1,18685.7,3.88764],
						[23318.5,18685.5,3.88764],
						[23311.4,18685.7,3.88764],
						[23311.8,18679.7,3.88764],
						[23317.2,18678.5,3.88728],
						[23327.5,18679.8,3.88764],
						[23333.3,18679.7,3.88764],
						[23353.4,18679.7,3.88764],
						[23360,18678.4,3.88732],
						[23369.8,18679.9,3.88764],
						[23375.4,18679.9,3.88764],
						[23373,18682.8,3.88764],
						[23354.8,18682.9,3.88764],
						[23324,18682.7,3.88764],
						[23312.8,18682.7,3.88764],
						[23295.2,18639.7,0.221703],
						[23294.7,18639.9,6.22253],
						[23290.9,18639.9,9.22236],
						[23312.9,18637.4,0.503],
						[23324.2,18632.1,0.503],
						[23312.9,18626.1,0.503],
						[23342.1,18636,0.503],
						[23337.7,18636,0.503],
						[23338.8,18630.1,0.503],
						[23342.2,18626.7,0.503],
						[23396.1,18628.3,0.503],
						[23380.3,18635.4,0.503],
						[23373.8,18629.5,0.503],
						[23387.2,18628,0.503],
						[23368.7,18624.2,0.503],
						[23397,18572.4,0.503],
						[23378.9,18573.7,0.503],
						[23386.9,18574,0.503],
						[23374.1,18578.5,0.503],
						[23383.6,18584.5,0.503],
						[23396.1,18582,0.503],
						[23391.1,18585,0.503],
						[23393.6,18633.9,0.503],
						[23398,18633.7,0.503],
						[23367.3,18573.6,0.503]
					];
	_StaticAssaultLocations2 = _StaticAssaultLocations2 call ExileClient_util_array_shuffle;
	*/
_ai_vehicle_armed = 
					[
						"B_G_Offroad_01_armed_F",
						"B_G_Offroad_01_AT_F",
						"I_C_Offroad_02_LMG_F",
						"I_C_Offroad_02_AT_F",
						"O_LSV_02_armed_viper_F",
						"O_T_LSV_02_AT_F",
						"B_LSV_01_armed_black_F",
						"B_LSV_01_AT_F",
						"Exile_Car_SUV_Armed_Black",
						"rhsusf_m1151_m2_v3_usmc_d",
						"rhsusf_m1025_w_m2",
						"rhsusf_M1239_M2_socom_wd",
						"HMMWV_M134"
					];
					
	_ArmedVehicleSpawnLocations =
							[
								[16668.8,13476.5,-0.000199318],
								[16613.3,13545.5,-0.000200272],
								[16686.9,13596.9,-0.000201225],
								[16816.3,13618.1,0],
								[16763.3,13511.9,-0.000200272],
								[16842.6,13560.5,2.73089]
							];
	_ArmedVehicleSpawnLocations = _ArmedVehicleSpawnLocations call ExileClient_util_array_shuffle;
	_ai_vehicle_1 = selectRandom _ai_vehicle_armed;
	
_ai_vehicle_tanks = 
					[
						"RHS_M2A3_BUSKIII",
						"rhs_t14_tv",
						"I_E_APC_tracked_03_cannon_F",
						"I_APC_Wheeled_03_cannon_F",
						"rhssaf_army_o_t72s",
						"rhsusf_m1a2sep1tuskiid_usarmy",
						"rhsusf_m1a2sep1tuskiwd_usarmy",
						"rhsusf_m1a1hc_wd",
						"rhs_t90sab_tv",
						"rhs_t72be_tv",
						"rhs_t90sm_tv",
						"RHS_M6_wd"
						
					];
					
	_TankSpawnLocations =
							[
								[16616.6,13501.6,0],
								[16647.3,13396.6,4.63143],
								[16751.5,13460.8,4.76837e-007],
								[16796.2,13588,-4.76837e-007],
								[16857.7,13574.2,6.5239],
								[16571.6,13617.9,0]
							];
	TankSpawnLocations = _TankSpawnLocations call ExileClient_util_array_shuffle;
	_ai_vehicle_0 = selectRandom _ai_vehicle_tanks;

_group4 =
				[
					_StaticAssaultLocations1,
					_AICount4,
					_difficulty,
					"assault",
					_side
				] call DMS_fnc_SpawnAIGroup_MultiPos;			
				[
					_group4,								// GROUP or OBJECT: Group or unit whose behavior is to be changed.
					_pos,									// ARRAY (positionATL): Location for the AI to guard.
					_difficulty,							// STRING: Difficulty of the AI.
					"AWARE"									// (OPTIONAL) STRING: AI Behavior. Refer to: https://community.bistudio.com/wiki/setBehaviour
				] call DMS_fnc_SetGroupBehavior;
				
				{
					_x disableAI "PATH";
				} forEach (units _group4);

_group5 =
				[
					_StaticAssaultLocations2,
					_AICount5,
					_difficulty,
					"assault",
					_side
				] call DMS_fnc_SpawnAIGroup_MultiPos;			
				[
					_group5,								// GROUP or OBJECT: Group or unit whose behavior is to be changed.
					_pos,									// ARRAY (positionATL): Location for the AI to guard.
					_difficulty,							// STRING: Difficulty of the AI.
					"AWARE"									// (OPTIONAL) STRING: AI Behavior. Refer to: https://community.bistudio.com/wiki/setBehaviour
				] call DMS_fnc_SetGroupBehavior;
				
				{
					_x disableAI "PATH";
				} forEach (units _group5);

_group6 =
			[
				_AISniperLocations1,
				_AICount6,
				_difficulty,
				"sniper",
				_side
			] call DMS_fnc_SpawnAIGroup_MultiPos;			
			[
				_group6,								// GROUP or OBJECT: Group or unit whose behavior is to be changed.
				_pos,									// ARRAY (positionATL): Location for the AI to guard.
				_difficulty,							// STRING: Difficulty of the AI.
				"AWARE"									// (OPTIONAL) STRING: AI Behavior. Refer to: https://community.bistudio.com/wiki/setBehaviour
			] call DMS_fnc_SetGroupBehavior;
			
			{
				_x disableAI "PATH";
			} forEach (units _group6);
										
_staticGuns = switch (_difficultyM) do {
    case "moderate",
	case "difficult",
    case "hardcore": {
						[
							[
								[16663.3,13421,18.125],			// All Static AI Are on top of the tall Green Towers
								[16544.5,13548.3,17.5004],			// 
								[16756.5,13479.3,18.5452],			// 
								[16802.1,13653.3,18.1003]			// 
							],
							_group1,
							"assault",
							_difficulty,
							"bandit",
							"random"
						] call DMS_fnc_SpawnAIStaticMG;
					 };			
		case "easy": {};
					 };


if (_armedVehiclechance >= (random 100)) then {
												_veh1 = 
														[
															_ArmedVehicleSpawnLocations,
															_group1,
															"random",
															_difficulty,
															_side,
															_ai_vehicle_1
														] call DMS_fnc_SpawnAIVehicle;
												} else
												{};		
	
if (_tankChance >= (random 100)) then {	
										_veh =
												[
													_TankSpawnLocations,
													_group1,
													"random",
													_difficulty,
													_side,
													_ai_vehicle_0
												] call DMS_fnc_SpawnAIVehicle;
									} else
										{};	
	
// Define the classnames and locations where the crates can spawn (at least 2, since we're spawning 2 crates)
_crateClasses_and_Positions =
								[
									[[16541.2,13649.1,2.55422],"Exile_Container_SupplyBox"],
									[[16539.6,13652.6,3.1159],"Exile_Container_SupplyBox"]
								];

	// Shuffle the list
	_crateClasses_and_Positions = _crateClasses_and_Positions call ExileClient_util_array_shuffle;

	{
		deleteVehicle (nearestObject _x);		// Make sure to remove any previous crates.
	} forEach _crateClasses_and_Positions;

	// Create Crates
	_crate0 = [_crateClasses_and_Positions select 0 select 1, _crateClasses_and_Positions select 0 select 0] call DMS_fnc_SpawnCrate;
	_crate1 = [_crateClasses_and_Positions select 1 select 1, _crateClasses_and_Positions select 1 select 0] call DMS_fnc_SpawnCrate;

	// Enable smoke on the crates due to size of area
	{
		_x setVariable ["DMS_AllowSmoke", true];
	} forEach [_crate0,_crate1];

// Define mission-spawned AI Units
_missionAIUnits =
					[
						_group1,
						_group2,
						_group3,
						_group4,
						_group5,
						_group6,
						_group7
					];

_ReinforcementTeamChance = ["NONE", "Alpha", "Charlie", "Bravo", "Delta", "Echo", "NONE"];	 //create possible armed vehicle chance at moderate mission. add more of one color to weight it towards that. ("yellow" has no vehicle, "green" has vehicle)
_ReinforcementTeam = selectRandom _ReinforcementTeamChance;

if ((_ReinforcementTeam == "Alpha")) then {
_groupReinforcementsInfo = switch (_difficultyM) do
					{
					case "moderate",
					case "difficult",
					case "hardcore": 
						{
							[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											10,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[[16957.2,13383.6,0]]
									],
									"random",
									_difficulty,
									_side,
									"increasing_resistance",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										15,	// SCALAR: The (maximum) number of units to spawn as reinforcements.
										20,		// SCALAR: After reinforcements, "_AICount" is increased by this amount, so subsequent reinforcements will be spawned for even greater amounts of AI (increasing the number of total AI, until "_maxAICount" is reached).
										20				// (OPTIONAL) SCALAR: Maximum number of AI Units after reinforcements. Default value is equivalent to _AICount. Set to 0 for no limit.
									]
								]
							];
						};
					case "easy": 
						{
			   				[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											0,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[16720.2,13552.6,0]
									],
									"random",
									_difficulty,
									_side,
									"increasing_resistance",
									[
										0,		// Set in difficulty select - Reinforcements will only trigger if there's fewer than X members left
										0			// X reinforcement units per wave. >> you can change this in mission difficulty section
									]
								]
							];
						};
					};
				};		
/*						
if ((_ReinforcementTeam == "Bravo")) then {
_groupReinforcementsInfo = switch (_difficultyM) do
					{
					case "difficult",
					case "hardcore": 
						{
							[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											1,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[22648.3,17792.9,0.00151443]
									],
									"random",
									_difficulty,
									_side,
									"armed_vehicle",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										"B_MRAP_01_hmg_F"				// (OPTIONAL) STRING: The classname of the vehicle to spawn. Use "random" to select a random vehicle from "DMS_ArmedVehicles". Default: "random"
									]
								]
							];
						};
					case "easy",
					case "moderate": 
						{
							[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											0,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[22648.3,17792.9,0.00151443]
									],
									"random",
									_difficulty,
									_side,
									"armed_vehicle",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										"B_MRAP_01_hmg_F"				// (OPTIONAL) STRING: The classname of the vehicle to spawn. Use "random" to select a random vehicle from "DMS_ArmedVehicles". Default: "random"
									]
								]
							];
						};
					};
				};
						
if ((_ReinforcementTeam == "Charlie")) then {						
_groupReinforcementsInfo =	switch (_difficultyM) do
					{
					case "hardcore": 
						{
							[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											1,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
									[23262.6,18608.4,75]
									],
									"random",
									_difficulty,
									_side,
									"heli_troopers",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										true,               // BOOLEAN: Whether or not to eject Fire-From-Vehicle (FFV) gunners.
										10,                    // SCALAR: Maximum number of AI to eject from the aircraft. Set to a really high # to ignore (like 999).
										false,               // BOOLEAN: Whether or not to keep the heli flying around as a gunship.
										[23262.6,18608.4,75],                     // OBJECT or ARRAY (OPTIONAL - Position2D or 3D): The location to drop the reinforcements at. The drop point will default to the group leader.
										"Exile_Chopper_Huey_Armed_Green",                     // STRING (OPTIONAL): The classname of the heli to spawn.
										[24077.9,17209.3,75]                       // ARRAY (OPTIONAL - Position2D or 3D): The position for the heli to spawn at.
									]
								]
							];
						};
					case "easy",
					case "moderate",
					case "difficult": 
						{
							[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											0,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
									[23262.6,18608.4,75]
									],
									"random",
									_difficulty,
									_side,
									"heli_troopers",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										true,               // BOOLEAN: Whether or not to eject Fire-From-Vehicle (FFV) gunners.
										10,                    // SCALAR: Maximum number of AI to eject from the aircraft. Set to a really high # to ignore (like 999).
										false,               // BOOLEAN: Whether or not to keep the heli flying around as a gunship.
										[23262.6,18608.4,75],                     // OBJECT or ARRAY (OPTIONAL - Position2D or 3D): The location to drop the reinforcements at. The drop point will default to the group leader.
										"Exile_Chopper_Huey_Armed_Green",                     // STRING (OPTIONAL): The classname of the heli to spawn.
										[24077.9,17209.3,75]                       // ARRAY (OPTIONAL - Position2D or 3D): The position for the heli to spawn at.
									]
								]
							];
						};
					};
				};
						
if ((_ReinforcementTeam == "Delta")) then {
_groupReinforcementsInfo = switch (_difficultyM) do
					{
					case "hardcore":
						{
							[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											10,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[23811.7,19387.3,0.00145364]
									],
									"random",
									_difficulty,
									_side,
									"increasing_resistance",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										15,	// SCALAR: The (maximum) number of units to spawn as reinforcements.
										20,		// SCALAR: After reinforcements, "_AICount" is increased by this amount, so subsequent reinforcements will be spawned for even greater amounts of AI (increasing the number of total AI, until "_maxAICount" is reached).
										20				// (OPTIONAL) SCALAR: Maximum number of AI Units after reinforcements. Default value is equivalent to _AICount. Set to 0 for no limit.
									]
								],
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											1,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[22648.3,17792.9,0.00151443]
									],
									"random",
									_difficulty,
									_side,
									"armed_vehicle",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										"B_MRAP_01_hmg_F"				// (OPTIONAL) STRING: The classname of the vehicle to spawn. Use "random" to select a random vehicle from "DMS_ArmedVehicles". Default: "random"
									]
								]
							];
						};
					case "easy",
					case "moderate",
					case "difficult": 
						{
			   				[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											0,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[23811.7,19387.3,0.00145364]
									],
									"random",
									_difficulty,
									_side,
									"increasing_resistance",
									[
										0,		// Set in difficulty select - Reinforcements will only trigger if there's fewer than X members left
										0			// X reinforcement units per wave. >> you can change this in mission difficulty section
									]
								]
							];
						};
					};
				};		

if ((_ReinforcementTeam == "Echo")) then {
_groupReinforcementsInfo = switch (_difficultyM) do
					{
						case "hardcore":
						{
							[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											10,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[23811.7,19387.3,0.00145364]
									],
									"random",
									_difficulty,
									_side,
									"increasing_resistance",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										15,	// SCALAR: The (maximum) number of units to spawn as reinforcements.
										20,		// SCALAR: After reinforcements, "_AICount" is increased by this amount, so subsequent reinforcements will be spawned for even greater amounts of AI (increasing the number of total AI, until "_maxAICount" is reached).
										20				// (OPTIONAL) SCALAR: Maximum number of AI Units after reinforcements. Default value is equivalent to _AICount. Set to 0 for no limit.
									]
								],
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											1,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
									[23262.6,18608.4,75]
									],
									"random",
									_difficulty,
									_side,
									"heli_troopers",
									[
										_AItrigger,				// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
										true,               // BOOLEAN: Whether or not to eject Fire-From-Vehicle (FFV) gunners.
										10,                    // SCALAR: Maximum number of AI to eject from the aircraft. Set to a really high # to ignore (like 999).
										false,               // BOOLEAN: Whether or not to keep the heli flying around as a gunship.
										[23262.6,18608.4,75],                     // OBJECT or ARRAY (OPTIONAL - Position2D or 3D): The location to drop the reinforcements at. The drop point will default to the group leader.
										"Exile_Chopper_Huey_Armed_Green",                     // STRING (OPTIONAL): The classname of the heli to spawn.
										[24077.9,17209.3,75]                       // ARRAY (OPTIONAL - Position2D or 3D): The position for the heli to spawn at.
									]
								]
							];
						};
					case "easy",
					case "moderate",
					case "difficult": 
						{
			   				[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											0,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[23811.7,19387.3,0.00145364]
									],
									"random",
									_difficulty,
									_side,
									"increasing_resistance",
									[
										0,		// Set in difficulty select - Reinforcements will only trigger if there's fewer than X members left
										0			// X reinforcement units per wave. >> you can change this in mission difficulty section
									]
								]
							];
						};
					};
				};
	
if ((_ReinforcementTeam == "NONE")) then {
_groupReinforcementsInfo =
							[
								[
									_group5,			// pass the group
									[
										[
											0,		// Let's limit number of units instead...
											0
										],
										[
											0,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
											0
										]
									],
									[
										0,		// The delay between reinforcements. >> you can change this in difficulty settings
										diag_tickTime
									],
									[
										[23811.7,19387.3,0.00145364]
									],
									"random",
									_difficulty,
									_side,
									"increasing_resistance",
									[
										0,		// Set in difficulty select - Reinforcements will only trigger if there's fewer than X members left
										0			// X reinforcement units per wave. >> you can change this in mission difficulty section
									]
								]
							];
						};
						*/	
// setup crates with items from choices
_crate_loot_values0 =
						[
							_crate_weapons0,		// Set in difficulty select - Weapons
							_crate_items0,			// Set in difficulty select - Items
							_crate_backpacks0 		// Set in difficulty select - Backpacks
						];
_crate_loot_values1 =
						[
							_crate_weapons1,		// Set in difficulty select - Weapons
							_crate_items1,			// Set in difficulty select - Items
							_crate_backpacks1 		// Set in difficulty select - Backpacks
						];
// add cash to crate
_crate0 setVariable ["ExileMoney", _cash0,true];	
_crate1 setVariable ["ExileMoney", _cash1,true];	

switch (_difficultyM) do {
    case "easy": 	 {
						// Define mission-spawned objects and loot values
						_missionObjs =
										[
											[],
											[],
											[[_crate0,_crate_loot_values0],[_crate1,_crate_loot_values1]]
										];
					 };			
	case "moderate",
	case "difficult",
    case "hardcore": {
						_missionObjs =
										[
											_staticGuns,
											[],
											[[_crate0,_crate_loot_values0],[_crate1,_crate_loot_values1]]
										];
					 };
				};

// Define Mission Start message
_msgStart = ['#FFFF00',"A heavily guarded base has been located on the salt flats! There are reports they have a large weapon cache."];

// Define Mission Win message
_msgWIN = ['#0080ff',"Convicts have successfully assaulted the base on the salt flats and secured the cache!"];

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Seems like the guards got bored and left the base, taking the cache with them."];

// Define mission name (for map marker and logging)
_missionName = "Mercenary Base";

// Create Markers
_markers =
			[
				_pos,
				_missionName,
				_difficultyM
			] call DMS_fnc_CreateMarker;

_circle = _markers select 1;
_circle setMarkerDir 20;
_circle setMarkerSize [300,300];

_time = diag_tickTime;

// Parse and add mission info to missions monitor
_added =
			[
				_pos,
				[
					[
						"kill",
						[_group1,_group2,_group3,_group4,_group5,_group6,_group7]
					],
					[
						"playerNear",
						[_pos,150]
					]
				],
				_groupReinforcementsInfo,
				[
					_time,
					DMS_StaticMissionTimeOut call DMS_fnc_SelectRandomVal
				],
				_missionAIUnits,
				_missionObjs,
				[_missionName,_msgWIN,_msgLOSE],
				_markers,
				_side,
				_difficulty,
				[[],[]]
			] call DMS_fnc_AddMissionToMonitor_Static;

// Check to see if it was added correctly, otherwise delete the stuff
if !(_added) exitWith
{
	diag_log format ["DMS ERROR :: Attempt to set up mission %1 with invalid parameters for DMS_fnc_AddMissionToMonitor_Static! Deleting mission objects and resetting DMS_MissionCount.",_missionName];

	_cleanup = [];
	{
		_cleanup pushBack _x;
	} forEach _missionAIUnits;

	_cleanup pushBack ((_missionObjs select 0)+(_missionObjs select 1));
	
	{
		_cleanup pushBack (_x select 0);
	} foreach (_missionObjs select 2);

	_cleanup call DMS_fnc_CleanUp;

	// Delete the markers directly
	{deleteMarker _x;} forEach _markers;

	// Reset the mission count
	DMS_MissionCount = DMS_MissionCount - 1;
};

// Notify players
[_missionName,_msgStart] call DMS_fnc_BroadcastMissionStatus;

if (DMS_DEBUG) then
{
	(format ["MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time]) call DMS_fnc_DebugLog;
};						