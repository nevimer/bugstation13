/// Associative list of jobs to weighted lists of important rooms. Currently used by the Contract Killer.
GLOBAL_LIST_INIT(jobs_to_rooms, list(
	JOB_ASSISTANT = list(
		/area/station/commons/storage/primary = 6,
		/area/station/commons/storage/tools = 3,
		/area/station/commons/storage/art = 1,
	),
	JOB_ASSISTANT_ENG = list(
		/area/station/engineering/break_room = 9,
		/area/station/commons/storage/primary = 1,
	),
	JOB_ASSISTANT_MED = list(
		/area/station/medical/treatment_center = 9,
		/area/station/commons/storage/primary = 1,
	),
	JOB_ASSISTANT_SCI = list(
		/area/station/science/lab = 9,
		/area/station/commons/storage/primary = 1,
	),
	JOB_ASSISTANT_SRV = list(
		/area/station/hallway/secondary/service = 9,
		/area/station/commons/storage/primary = 1,
	),
	JOB_ATMOSPHERIC_TECHNICIAN = list(
		/area/station/engineering/atmos = 2,
		/area/station/engineering/atmos/project = 1,
		/area/station/engineering/atmos/pumproom = 1,
		/area/station/engineering/atmos/storage = 1,
	),
	JOB_BARTENDER = list(
		/area/station/service/bar/backroom = 6,
		/area/station/service/bar = 4,
		/area/station/commons/lounge = 1,
	),
	JOB_BOTANIST = list(
		/area/station/service/hydroponics = 1,
	),
	JOB_CAPTAIN = list(
		/area/station/command/heads_quarters/captain = 6,
		/area/station/command/heads_quarters/captain/private = 3,
		/area/station/command/bridge = 1,
		/area/station/command/meeting_room = 1,
		),
	JOB_CARGO_TECHNICIAN = list(
		/area/station/cargo/office = 6,
		/area/station/cargo/storage = 4,
		/area/station/cargo/sorting = 2,
		/area/station/cargo/warehouse = 2,
	),
	JOB_CHAPLAIN = list(
		/area/station/service/chapel/office = 7,
		/area/station/service/chapel/funeral = 2,
		/area/station/service/chapel = 1,
	),
	JOB_CHEMIST = list(
		/area/station/medical/pharmacy = 2,
		/area/station/medical/chemistry = 1,
	),
	JOB_CHIEF_ENGINEER = list(
		/area/station/command/heads_quarters/ce = 8,
		/area/station/command/bridge = 1,
		/area/station/command/meeting_room = 1,
	),
	JOB_CHIEF_MEDICAL_OFFICER = list(
		/area/station/command/heads_quarters/cmo = 8,
		/area/station/command/bridge = 1,
		/area/station/command/meeting_room = 1,
	),
	JOB_CLOWN = list(
		/area/station/service/theater = 1,
		),
	JOB_COOK = list(
		/area/station/service/kitchen = 6,
		/area/station/service/kitchen/coldroom = 4,
		/area/station/service/cafeteria = 1,
		/area/station/service/kitchen/diner = 1,
	),
	JOB_CURATOR = list(
		/area/station/service/library/private = 20,
		/area/station/service/library = 10,
		/area/space = 1,
	),
	JOB_DETECTIVE = list(
		/area/station/security/detectives_office = 1,
	),
	JOB_GENETICIST = list(
		/area/station/science/genetics = 1,
	),
	JOB_HEAD_OF_PERSONNEL = list(
		/area/station/command/heads_quarters/hop = 8,
		/area/station/command/bridge = 1,
		/area/station/command/meeting_room = 1,
	),
	JOB_HEAD_OF_SECURITY = list(
		/area/station/command/heads_quarters/hos = 40,
		/area/station/command/bridge = 5,
		/area/station/command/meeting_room = 5,
		/area/station/ai_monitored/security/armory = 1, //truly cruel
	),
	JOB_JANITOR = list(
		/area/station/service/janitor = 1,
	),
	JOB_LAWYER = list(
		/area/station/service/lawoffice = 2,
		/area/station/security/courtroom = 1,
	),
	JOB_MEDICAL_DOCTOR = list(
		/area/station/medical/treatment_center = 10,
		/area/station/medical/storage = 2,
		/area/station/medical/surgery/theatre = 2,
		/area/station/medical/morgue = 1,
		/area/station/medical/break_room = 1,
		/area/station/medical/surgery/fore = 1,
		/area/station/medical/surgery/aft = 1,
		/area/station/medical/cryo = 1,
	),
	JOB_MIME = list(
		/area/station/service/theater = 1,
	),
	JOB_PARAMEDIC = list(
		/area/station/medical/paramedic = 4, //There's only two maps that actually have a paramedic-specific area. Still, it should have the highest weight there.
		/area/station/medical/storage = 2,
		/area/station/medical/treatment_center = 2,
		/area/station/medical/break_room = 1,
	),
	JOB_PRISONER = list(
		/area/station/security/prison = 6,
		/area/station/security/prison/safe = 4,
		/area/station/security/prison/rec = 1,
		/area/station/security/prison/mess = 1,
		/area/station/security/prison/work = 1,
		/area/station/security/prison/garden = 1,
	),
	JOB_PSYCHOLOGIST = list(
		/area/station/medical/psychology = 1,
	),
	JOB_QUARTERMASTER = list(
		/area/station/command/heads_quarters/qm = 8,
		/area/station/command/bridge = 1,
		/area/station/command/meeting_room = 1,
	),
	JOB_RESEARCH_DIRECTOR = list(
		/area/station/command/heads_quarters/rd = 8,
		/area/station/command/bridge = 1,
		/area/station/command/meeting_room = 1,
	),
	JOB_ROBOTICIST = list(
		/area/station/science/robotics/lab = 5,
		/area/station/science/robotics/mechbay = 1,
	),
	JOB_SCIENTIST = list(
		/area/station/science/lab = 8,
		/area/station/science/xenobiology = 1,
		/area/station/science/cytology = 1,
		/area/station/science/ordnance = 1,
		/area/station/science/explab = 1,
		/area/station/science/circuits = 1,
	),
	JOB_SECURITY_OFFICER = list(
		/area/station/security/office = 4,
		/area/station/security/lockers = 2,
	),
	JOB_SECURITY_OFFICER_ENGINEERING = list(
		/area/station/security/checkpoint/engineering = 8,
		/area/station/security/office = 2,
		/area/station/security/lockers = 1,
	),
	JOB_SECURITY_OFFICER_MEDICAL = list(
		/area/station/security/checkpoint/medical = 8,
		/area/station/security/office = 2,
		/area/station/security/lockers = 1,
	),
	JOB_SECURITY_OFFICER_SCIENCE = list(
		/area/station/security/checkpoint/science = 8,
		/area/station/security/checkpoint/science/research = 8,
		/area/station/security/office = 2,
		/area/station/security/lockers = 1,
	),
	JOB_SECURITY_OFFICER_SUPPLY = list(
		/area/station/security/checkpoint/supply = 8,
		/area/station/security/office = 2,
		/area/station/security/lockers = 1,
	),
	JOB_SHAFT_MINER = list(
		/area/station/cargo/miningoffice = 8,
		/area/mine/production = 1,
	),
	JOB_STATION_ENGINEER = list(
		/area/station/engineering/break_room = 15,
		/area/station/engineering/main = 10,
		/area/station/engineering/storage = 10,
		/area/station/engineering/engine_smes = 10,
		/area/station/engineering/storage/tech = 5,
		/area/station/engineering/supermatter/room = 5,
		/area/station/engineering/supermatter = 1, //i just think this would be funny
	),
	JOB_VIROLOGIST = list(
		/area/station/medical/virology = 5,
		/area/station/medical/virology/isolation = 1,
	),
	JOB_WARDEN = list(
		/area/station/security/warden = 40,
		/area/station/security/brig = 10,
		/area/station/ai_monitored/security/armory = 1, //truly cruel
	),
))
