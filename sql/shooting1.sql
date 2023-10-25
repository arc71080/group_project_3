 DROP TABLE IF EXISTS shootings;
 DROP TABLE IF EXISTS state_pop;
 DROP TABLE IF EXISTS county_pop;

<<<<<<< HEAD
<<<<<<< HEAD
create table state_pop (
	state varchar not null primary key,
	population decimal (9,1) not null,
	male decimal not null,
	female decimal not null, 
	white decimal not null,
	black decimal not null,
	native decimal not null,
	asian decimal not null,
	pacific decimal not null,
	hispanic decimal,
	per_capita_income decimal (7,2) not null,
	poverty_count decimal not null,
	poverty_rate decimal (4,2) not null
);

create table county_pop (
	county integer not null primary key,
	county_state varchar not null,
	population decimal (9,1) not null,
	male decimal (9,1 )not null,
	female decimal (9,1) not null, 
	white decimal (9,1),
	black decimal (9,1),
	native decimal (9,1),
	asian decimal (9,1),
	pacific decimal (9,1),
	hispanic decimal (9,1),
	per_capita_income decimal (7,2) not null,
	poverty_count decimal (8,1)not null,
	poverty_rate decimal (4,2) not null
);

=======
>>>>>>> origin/Jodee
=======
>>>>>>> refs/remotes/origin/main
--Create table and view columns for titles
create table shootings (
	lat decimal,
	long decimal,
	state_id varchar, 
	county varchar, 
	city varchar,
	district_name varchar, 
<<<<<<< HEAD
<<<<<<< HEAD
	school_name varchar primary key,
=======
	school_name varchar,
>>>>>>> origin/Jodee
=======
	school_name varchar,
>>>>>>> refs/remotes/origin/main
	shooting_date date not null,
	day_of_week varchar not null, 
	shooting_time time, 
	shooting_time1 varchar,
	school_type varchar not null, 
	enrollment integer not null, 
	killed integer not null,
	injured integer not null,
	casualties integer not null,
	shooting_type varchar not null,
	age_shooter1 integer,
	gender_shooter1 varchar,
	race_ethnicity_shooter1 varchar,
	shooter_relationship1 varchar,
	shooter_deceased1 integer,
	deceased_notes1 varchar,
	age_shooter2 integer,
	gender_shooter2 varchar,
	race_ethnicity_shooter2 varchar,
	shooter_relationship2 varchar,
	shooter_deceased2 integer,
	deceased_notes2 varchar,
	white integer,
	black integer,
	hispanic integer,
	asian integer,
	american_indian_alaska_native integer,
	hawaiian_native_pacific_islander integer,
	two_or_more integer,
	resource_officer integer not null,
	weapon varchar,
	weapon_source varchar,
	staffing decimal,
<<<<<<< HEAD
<<<<<<< HEAD
	lunch integer,
	foreign key (state_id) references state(state_pop),
	foreign key (county) references county(county_pop)
);


=======
=======
>>>>>>> refs/remotes/origin/main
	lunch integer
);

create table state_pop (
	state varchar not null,
	population decimal (9,1) not null,
	male decimal not null,
	female decimal not null, 
	white decimal not null,
	black decimal not null,
	native decimal not null,
	asian decimal not null,
	pacific decimal not null,
	hispanic decimal,
	per_capita_income decimal (7,2) not null,
	poverty_count decimal not null,
	poverty_rate decimal (4,2) not null
);

create table county_pop (
	county integer not null,
	county_state varchar not null,
	population decimal (9,1) not null,
	male decimal (9,1 )not null,
	female decimal (9,1) not null, 
	white decimal (9,1),
	black decimal (9,1),
	native decimal (9,1),
	asian decimal (9,1),
	pacific decimal (9,1),
	hispanic decimal (9,1),
	per_capita_income decimal (7,2) not null,
	poverty_count decimal (8,1)not null,
	poverty_rate decimal (4,2) not null
);
<<<<<<< HEAD
>>>>>>> origin/Jodee
=======
>>>>>>> refs/remotes/origin/main

--View the tables
select * from shootings;
select * from state_pop;
select * from county_pop;