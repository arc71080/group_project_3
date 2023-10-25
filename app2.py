# import necessary libraries
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
engine = create_engine("sqlite:///shooting.sqlite")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(autoload_with=engine)


# Save reference to the table
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
        f"/api/v1.0/county population"
    )

@app.route("/api/v1.0/county population")
def names():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of all counties"""
    # Query all counties
    results = session.query(county_pop.County, county_pop.County_State, county_pop.Population, county_pop.Male, county_pop.Female,
                            county_pop.White, county_pop.Black, county_pop.Native, county_pop.Asian,
                            county_pop.Pacific, county_pop.Hispanic, county_pop.Per_Capita_Income, county_pop.Poverty_Count, county_pop.Poverty_Rate).all()
    session.close()
    # Create a dictionary from the row data and append to a list of counties
    all_county_pop = []
    for result in results:
        county_pop_dict = {}
        county_pop_dict["County"] = result.County
        county_pop_dict["County_State"] = result.County_State
        county_pop_dict["Population"] = result.Population
        county_pop_dict["Male"] = result.Male
        county_pop_dict["Female"] = result.Female
        county_pop_dict["White"] = result.White
        county_pop_dict["Black"] = result.Black
        county_pop_dict["Native"] = result.Native
        county_pop_dict["Asian"] = result.Asian
        county_pop_dict["Pacific"] = result.Pacific
        county_pop_dict["Hispanic"] = result.Hispanic
        county_pop_dict["Per_Capita_Income"] = result.Per_Capita_Income
        county_pop_dict["Poverty_Count"] = result.Poverty_Count
        county_pop_dict["Poverty_Rate"] = result.Poverty_Rate
        all_county_pop.append(county_pop_dict)

    return jsonify(all_county_pop)



if __name__ == '__main__':
    app.run(debug=True)