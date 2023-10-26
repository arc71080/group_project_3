import numpy as np
import datetime as dt

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

#################################################
# Database Setup
#################################################
engine = create_engine("sqlite:///../sql/shooting.sqlite")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(autoload_with=engine)


# Save reference to the table
passengers = Base.classes.passenger
shooting = Base.classes.shootings
state_pop = Base.classes.population2022
county_pop = Base.classes.county_pop2022


#################################################
# Flask Setup
#################################################
app = Flask(__name__)


#################################################
# Flask Routes
#################################################

@app.route("/")
def welcome():
    """List all available api routes."""
    return (
        f"Available Routes:<br/>"
        f"/api/v1.0/shooting<br/>"
        f"/api/v1.0/state population"
    )


@app.route("/api/v1.0/shooting")
def names():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of all passenger names"""
    # Query all shootings
    results = session.query(shooting.lat, shooting.long, shooting.state_id, shooting.county, shooting.city, 
                            shooting.district_name, shooting.school_name, shooting.day_of_week, shooting.shooting1_time,
                            shooting.school_type, shooting.enrollment, shooting.killed, shooting.injured, shooting.casualties,
                            shooting.shooting_type, shooting.age_shooter1, shooting.gender_shooter1, shooting.race_ethnicity_shooter1, shooting.weapon,
                            shooting.weapon_source).all()

    session.close()

    # Create a dictionary from the row data and append to a list of all_passengers
    all_shootings = []
    for result in results:
        shootings_dict = {}
        shootings_dict["lat"] = result.lat
        shootings_dict["long"] = result.long
        shootings_dict["state_id"] = result.state_id
        shootings_dict["county"] = result.county
        shootings_dict["city"] = result.city
        shootings_dict["district_name"] = result.district_name
        shootings_dict["school_name"] = result.school_name
        shootings_dict["day_of_week"] = result.day_of_week
        shootings_dict["shooting1_time"] = result.shooting1_time
        shootings_dict["school_type"] = result.school_type
        shootings_dict["enrollment"] = result.enrollment
        shootings_dict["killed"] = result.killed
        shootings_dict["injured"] = result.injured
        shootings_dict["casualties"] = result.casualties
        shootings_dict["shooting_type"] = result.shooting_type
        shootings_dict["age_shooter1"] = result.age_shooter1
        shootings_dict["gender_shooter1"] = result.gender_shooter1
        shootings_dict["race_ethnicity_shooter1"] = result.race_ethnicity_shooter1
        shootings_dict["weapon"] = result.weapon
        shootings_dict["weapon_source"] = result.weapon_source
        all_shootings.append(shootings_dict)

    return jsonify(all_shootings)

@app.route("/api/v1.0/state population")
def station():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of all states"""
    # Query all states
    results = session.query(state_pop.State, state_pop.Population, state_pop.Female, state_pop.White, state_pop.Black,
                            state_pop.Native, state_pop.Asian, state_pop.Pacific, state_pop.Hispanic,
                            state_pop.Per_Capita_Income, state_pop.Poverty_Count, state_pop.Poverty_Rate).all()

    session.close()

    # Create a dictionary from the row data and append to a list of all_passengers
    all_state_pop = []
    for result in results:
        state_pop_dict = {}
        state_pop_dict["State"] = result.State
        state_pop_dict["population"] = result.Population
        state_pop_dict["female"] = result.Female
        state_pop_dict["white"] = result.White
        state_pop_dict["black"] = result.Black
        state_pop_dict["native"] = result.Native
        state_pop_dict["asian"] = result.Asian
        state_pop_dict["pacific"] = result.Pacific
        state_pop_dict["hispanic"] = result.Hispanic
        state_pop_dict["per_capita_income"] = result.Per_Capita_Income
        state_pop_dict["poverty_count"] = result.Poverty_Count
        state_pop_dict["poverty_rate"] = result.Poverty_Rate
        all_state_pop.append(state_pop_dict)

    return jsonify(all_state_pop)


if __name__ == '__main__':
    app.run(debug=True)

