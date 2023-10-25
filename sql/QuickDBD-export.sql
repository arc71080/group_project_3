<<<<<<< HEAD
﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "shootings" (
    "lat" decimal   NOT NULL,
    "long" decimal   NOT NULL,
    "state_id" varchar   NOT NULL,
    "county" varchar   NOT NULL,
    "city" varchar   NOT NULL,
    "district_name" varchar   NOT NULL,
    "school_name" varchar   NOT NULL,
    "shooting_date" date   NOT NULL,
    "day_of_week" varchar   NOT NULL,
    "shooting_time" time   NOT NULL,
    "shooting_time1" varchar   NOT NULL,
    "school_type" varchar   NOT NULL,
    "enrollment" integer   NOT NULL,
    "killed" integer   NOT NULL,
    "injured" integer   NOT NULL,
    "casualties" integer   NOT NULL,
    "shooting_type" varchar   NOT NULL,
    "age_shooter1" integer   NOT NULL,
    "gender_shooter1" varchar   NOT NULL,
    "race_ethnicity_shooter1" varchar   NOT NULL,
    "shooter_relationship1" varchar   NOT NULL,
    "shooter_deceased1" integer   NOT NULL,
    "deceased_notes1" varchar   NOT NULL,
    "age_shooter2" integer   NOT NULL,
    "gender_shooter2" varchar   NOT NULL,
    "race_ethnicity_shooter2" varchar   NOT NULL,
    "shooter_relationship2" varchar   NOT NULL,
    "shooter_deceased2" integer   NOT NULL,
    "deceased_notes2" varchar   NOT NULL,
    "white" integer   NOT NULL,
    "black" integer   NOT NULL,
    "hispanic" integer   NOT NULL,
    "asian" integer   NOT NULL,
    "american_indian_alaska_native" integer   NOT NULL,
    "hawaiian_native_pacific_islander" integer   NOT NULL,
    "two_or_more" integer   NOT NULL,
    "resource_officer" integer   NOT NULL,
    "weapon" varchar   NOT NULL,
    "weapon_source" varchar   NOT NULL,
    "staffing" decimal   NOT NULL,
    "lunch" integer   NOT NULL
);

CREATE TABLE "state_pop" (
    "state" varchar   NOT NULL,
    "population" decimal(9,1)   NOT NULL,
    "male" decimal   NOT NULL,
    "female" decimal   NOT NULL,
    "white" decimal   NOT NULL,
    "black" decimal   NOT NULL,
    "native" decimal   NOT NULL,
    "asian" decimal   NOT NULL,
    "pacific" decimal   NOT NULL,
    "hispanic" decimal   NOT NULL,
    "per_capita_income" decimal(7,2)   NOT NULL,
    "poverty_count" decimal   NOT NULL,
    "poverty_rate" decimal(4,2)   NOT NULL,
    CONSTRAINT "pk_state_pop" PRIMARY KEY (
        "state"
     )
);

CREATE TABLE "county_pop" (
    "county" integer   NOT NULL,
    "county_state" varchar   NOT NULL,
    "population" decimal(9,1)   NOT NULL,
    "male" decimal(9,1)   NOT NULL,
    "female" decimal(9,1)   NOT NULL,
    "white" decimal   NOT NULL,
    "black" decimal(9,1)   NOT NULL,
    "native" decimal(9,1)   NOT NULL,
    "asian" decimal(9,1)   NOT NULL,
    "pacific" decimal(9,1)   NOT NULL,
    "hispanic" decimal(9,1)   NOT NULL,
    "per_capita_income" decimal(7,2)   NOT NULL,
    "poverty_count" decimal(8,1)   NOT NULL,
    "poverty_rate" decimal(4,2)   NOT NULL,
    CONSTRAINT "pk_county_pop" PRIMARY KEY (
        "county"
     )
);

ALTER TABLE "shootings" ADD CONSTRAINT "fk_shootings_state_id" FOREIGN KEY("state_id")
REFERENCES "state_pop" ("state");

ALTER TABLE "shootings" ADD CONSTRAINT "fk_shootings_county" FOREIGN KEY("county")
REFERENCES "county_pop" ("county");

=======
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "shootings" (
    "lat" decimal   NOT NULL,
    "long" decimal   NOT NULL,
    "state_id" varchar   NOT NULL,
    "county" varchar   NOT NULL,
    "city" varchar   NOT NULL,
    "district_name" varchar   NOT NULL,
    "school_name" varchar   NOT NULL,
    "shooting_date" date   NOT NULL,
    "day_of_week" varchar   NOT NULL,
    "shooting_time" time   NOT NULL,
    "shooting_time1" varchar   NOT NULL,
    "school_type" varchar   NOT NULL,
    "enrollment" integer   NOT NULL,
    "killed" integer   NOT NULL,
    "injured" integer   NOT NULL,
    "casualties" integer   NOT NULL,
    "shooting_type" varchar   NOT NULL,
    "age_shooter1" integer   NOT NULL,
    "gender_shooter1" varchar   NOT NULL,
    "race_ethnicity_shooter1" varchar   NOT NULL,
    "shooter_relationship1" varchar   NOT NULL,
    "shooter_deceased1" integer   NOT NULL,
    "deceased_notes1" varchar   NOT NULL,
    "age_shooter2" integer   NOT NULL,
    "gender_shooter2" varchar   NOT NULL,
    "race_ethnicity_shooter2" varchar   NOT NULL,
    "shooter_relationship2" varchar   NOT NULL,
    "shooter_deceased2" integer   NOT NULL,
    "deceased_notes2" varchar   NOT NULL,
    "white" integer   NOT NULL,
    "black" integer   NOT NULL,
    "hispanic" integer   NOT NULL,
    "asian" integer   NOT NULL,
    "american_indian_alaska_native" integer   NOT NULL,
    "hawaiian_native_pacific_islander" integer   NOT NULL,
    "two_or_more" integer   NOT NULL,
    "resource_officer" integer   NOT NULL,
    "weapon" varchar   NOT NULL,
    "weapon_source" varchar   NOT NULL,
    "staffing" decimal   NOT NULL,
    "lunch" integer   NOT NULL
);

CREATE TABLE "state_pop" (
    "state" varchar   NOT NULL,
    "population" decimal(9,1)   NOT NULL,
    "male" decimal   NOT NULL,
    "female" decimal   NOT NULL,
    "white" decimal   NOT NULL,
    "black" decimal   NOT NULL,
    "native" decimal   NOT NULL,
    "asian" decimal   NOT NULL,
    "pacific" decimal   NOT NULL,
    "hispanic" decimal   NOT NULL,
    "per_capita_income" decimal(7,2)   NOT NULL,
    "poverty_count" decimal   NOT NULL,
    "poverty_rate" decimal(4,2)   NOT NULL,
    CONSTRAINT "pk_state_pop" PRIMARY KEY (
        "state"
     )
);

CREATE TABLE "county_pop" (
    "county" integer   NOT NULL,
    "county_state" varchar   NOT NULL,
    "population" decimal(9,1)   NOT NULL,
    "male" decimal(9,1)   NOT NULL,
    "female" decimal(9,1)   NOT NULL,
    "white" decimal   NOT NULL,
    "black" decimal(9,1)   NOT NULL,
    "native" decimal(9,1)   NOT NULL,
    "asian" decimal(9,1)   NOT NULL,
    "pacific" decimal(9,1)   NOT NULL,
    "hispanic" decimal(9,1)   NOT NULL,
    "per_capita_income" decimal(7,2)   NOT NULL,
    "poverty_count" decimal(8,1)   NOT NULL,
    "poverty_rate" decimal(4,2)   NOT NULL,
    CONSTRAINT "pk_county_pop" PRIMARY KEY (
        "county"
     )
);

ALTER TABLE "shootings" ADD CONSTRAINT "fk_shootings_state_id" FOREIGN KEY("state_id")
REFERENCES "state_pop" ("state");

ALTER TABLE "shootings" ADD CONSTRAINT "fk_shootings_county" FOREIGN KEY("county")
REFERENCES "county_pop" ("county");

>>>>>>> origin/Jodee
